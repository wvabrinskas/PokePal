//
//  UIImage+Tensor.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/12/24.
//

import Foundation
import UIKit
import Neuron

extension UIImage {
  
  convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
    let rect = CGRect(origin: .zero, size: size)
    UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
    color.setFill()
    UIRectFill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    guard let cgImage = image?.cgImage else { return nil }
    self.init(cgImage: cgImage)
  }
  
  func mergeWith(topImage: UIImage) -> UIImage {
    let bottomImage = self

    UIGraphicsBeginImageContext(size)

    let areaSize = CGRect(x: 0, y: 0, width: bottomImage.size.width, height: bottomImage.size.height)
    bottomImage.draw(in: areaSize)

    let topSize = CGRect(x: areaSize.midX - (topImage.size.width / 2),
                         y: areaSize.midY - (topImage.size.height / 2),
                         width: topImage.size.width,
                         height: topImage.size.height)
    
    topImage.draw(in: topSize, blendMode: .normal, alpha: 1.0)

    let mergedImage = UIGraphicsGetImageFromCurrentImageContext()!
    UIGraphicsEndImageContext()
    return mergedImage
  }
  
  func resizeImage(targetSize: CGSize) -> UIImage? {
    let size = self.size
    
    let widthRatio  = targetSize.width  / size.width
    let heightRatio = targetSize.height / size.height
    
    // Figure out what our orientation is, and use that to form the rectangle
    var newSize: CGSize
    if(widthRatio > heightRatio) {
      newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
    } else {
      newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
    }
    
    // This is the rect that we've calculated out and this is what is actually used below
    let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
    
    // Actually do the resizing to the rect using the ImageContext stuff
    UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
    self.draw(in: rect)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return newImage
  }
  
  // Reconstructs a UIImage from a tensor produced by asRGBTensor(zeroCenter: false).
  // Tensor layout: depth=3 (R/G/B), each slice flat row-major [rows * columns].
  static func from(_ tensor: Tensor) -> UIImage {
    guard tensor.size.depth == 3 else { return UIImage() }

    let height = tensor.size.rows
    let width = tensor.size.columns
    let rSlice = tensor.depthSlice(0)
    let gSlice = tensor.depthSlice(1)
    let bSlice = tensor.depthSlice(2)

    var rgba = [UInt8](repeating: 255, count: width * height * 4)
    for i in 0..<(width * height) {
      rgba[i * 4 + 0] = UInt8(min(max(rSlice[i] * 255.0, 0), 255))
      rgba[i * 4 + 1] = UInt8(min(max(gSlice[i] * 255.0, 0), 255))
      rgba[i * 4 + 2] = UInt8(min(max(bSlice[i] * 255.0, 0), 255))
      rgba[i * 4 + 3] = 255
    }

    guard let provider = CGDataProvider(data: Data(rgba) as CFData),
          let cgImage = CGImage(
            width: width,
            height: height,
            bitsPerComponent: 8,
            bitsPerPixel: 32,
            bytesPerRow: width * 4,
            space: CGColorSpaceCreateDeviceRGB(),
            bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue),
            provider: provider,
            decode: nil,
            shouldInterpolate: false,
            intent: .defaultIntent
          ) else { return UIImage() }

    return UIImage(cgImage: cgImage)
  }
  
  func asRGBTensor(zeroCenter: Bool = false, reverse: Bool = false) -> Tensor {
    guard let pixelData = self.cgImage?.dataProvider?.data else { return Tensor() }
    
    let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
    
    var rArray: [Float] = []
    var gArray: [Float] = []
    var bArray: [Float] = []
    
    for y in 0..<Int(self.size.height) {
      for x in 0..<Int(self.size.width) {
        let pos = CGPoint(x: x, y: y)
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y) * 4) + Int(pos.x) * 4)
        
        var r = Float(data[pixelInfo])
        var g = Float(data[pixelInfo + 1])
        var b = Float(data[pixelInfo + 2])
        
        if zeroCenter {
          r = (r - 127.5) / 127.5
          g = (g - 127.5) / 127.5
          b = (b - 127.5) / 127.5
        } else {
          r = r / 255.0
          g = g / 255.0
          b = b / 255.0
        }
        
        rArray.append(r)
        gArray.append(g)
        bArray.append(b)
      }
    }
    
    var array = [rArray.reshape(columns: Int(self.size.width)),
                 gArray.reshape(columns: Int(self.size.width)),
                 bArray.reshape(columns: Int(self.size.width))]
    
    if reverse {
      array = [bArray.reshape(columns: Int(self.size.width)),
               gArray.reshape(columns: Int(self.size.width)),
               rArray.reshape(columns: Int(self.size.width))]
    }
    
    return Tensor(array)
  }

}
