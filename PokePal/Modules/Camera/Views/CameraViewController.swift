//
//  CameraViewController.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/14/24.
//

import Foundation
import AVFoundation
import Logger
import CoreImage
import UIKit

public class CameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
  private var previewLayer: AVCaptureVideoPreviewLayer?
  private lazy var metadataOutput = AVCaptureMetadataOutput()
    
  public override func viewDidLoad() {
    view.backgroundColor = .black
  }
  
  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  public override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    previewLayer?.removeFromSuperlayer()
    previewLayer = nil
  }
  
  func end() {
    previewLayer?.removeFromSuperlayer()
    previewLayer = nil
  }
  
  func setPreviewLayer(layer: AVCaptureVideoPreviewLayer) {
    previewLayer = layer
    //previewLayer?.frame = view.layer.bounds
    previewLayer?.videoGravity = .resizeAspectFill
    
    if let previewLayer {
      previewLayer.removeFromSuperlayer()
      view.layer.addSublayer(previewLayer)
    }
  }
}
