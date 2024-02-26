//
//
//  PokedexModule.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/12/24.
//
//

import Combine
import Foundation
import SwiftUI
import UIKit
import Neuron
import HuddleArch
import AVFoundation
import VisionKit

public protocol PokedexModuleComponent: Component {
  // add dependencies here
}

public class PokedexModuleComponentImpl: Component, PokedexModuleComponent {
  // implement dependencies here
  
  public override init(parent: Component?) {
    super.init(parent: parent)
  }
}

public struct PokemonResult: Identifiable {
  public var id: Int { pokemon.rawValue }
  var pokemon: Pokemon
  var confidence: Float
}

public protocol PokedexSupporting {
  var viewModel: PokedexViewModel { get }
  func whosThatPokemon() async
  func start() async
}

@Observable
public final class CameraModel {
  var viewfinderImage: Image?
}

public final class PokedexModule: ModuleObject<RootModuleHolderContext, PokedexModuleComponent, PokedexRouter>,
                                  PokedexSupporting {
  
  enum Model: String {
    case original = "151-pokemon-classifier"
    case all = "pokemon-classifier"
  }
  
  public var viewModel: PokedexViewModel = .init(imageProperties: ImageProperties(sharpness: 0.8,
                                                                                  contrast: 1.5))
  
  private var imageToPredict: CIImage?
  
  private var sequential: Sequential?
  
  private let model = Model.original
  
  public required init(holder: ModuleHolding?, context: Context, component: Component) {
    guard let modelUrl = Bundle.main.url(forResource: model.rawValue, withExtension: "smodel") else {
      fatalError("Could not build model")
    }
    
    super.init(holder: holder, context: context, component: component)

    Task.detached {
      self.sequential = Sequential.import(modelUrl)
      self.sequential?.compile()
      Task { @MainActor in
        self.viewModel.ready = true
      }
    }
  }
  
  public override func onActive() {
    super.onActive()
    
    Task {
      await start()
      await handleCameraPreviews()
    }
  }
  
  public func start() async {
    guard let cameraModule: CameraSupporting = holder?.module() else { return }
    
    await cameraModule.start()
  }
  
  public func whosThatPokemon() async {
    // move off main thread
    let result: [PokemonResult] = await withUnsafeContinuation { [self] continuation in
      Task { @MainActor in
        guard var imageToPredict else {
          continuation.resume(returning: [])
          return
        }
        
        imageToPredict = imageToPredict.applyingFilter("CIColorControls",
                                                       parameters: [
                                                        "inputContrast" : viewModel.imageProperties.contrast
                                                       ])
        
        imageToPredict = imageToPredict.applyingFilter("CISharpenLuminance",
                                                       parameters: [
                                                        "inputSharpness" : viewModel.imageProperties.sharpness
                                                       ])
        
        guard let imageRezised = imageToPredict.uiImage?.resizeImage(targetSize: CGSize(width: 64, height: 64)) else {
          continuation.resume(returning: [])
          return
        }
        
        var imageToUse = imageRezised
        
        let analyser = ImageAnalyzer()
        let interaction = ImageAnalysisInteraction()
        let configuration = ImageAnalyzer.Configuration([.text, .visualLookUp, .machineReadableCode])
        let analysis = try? await analyser.analyze(imageToUse, configuration: configuration)
        interaction.analysis = analysis

        if let uiImage = try? await interaction.image(for: interaction.subjects) {
          if let whiteImage = UIImage(color: .white, size: CGSize(width: 64, height: 64))?.resizeImage(targetSize: CGSize(width: 64, height: 64)) {
            let mergedImage = whiteImage.mergeWith(topImage: uiImage)
            imageToUse = mergedImage
          }
        }
        
        viewModel.inferenceImage = Image(uiImage: imageToUse)
        continuation.resume(returning: await getPrdiction(image: imageToUse))
      }
    }
    
    viewModel.pokemon = result
    viewModel.showResultsMenu = true
  }
  
  // MARK:  private
  
  // expects image of size 64 x 64
  private func getPrdiction(image: UIImage) async -> [PokemonResult] {
    await withUnsafeContinuation { continuation in
      guard let sequential else { return }
      Task.detached {
        let imageTensor = Tensor(image.asRGBTensor(zeroCenter: false).value.reversed()) // reversed because the pixel data is BGR not RGB for some reason...
        //let outImage = UIImage.from(imageTensor.value.flatten(), size: (64,64))
        let pokePrediction = sequential.predict(imageTensor).value.flatten()
        let podium = pokePrediction.sorted(by: { $0 > $1 })[0..<3]
        
        var result: [PokemonResult] = []
        podium.forEach { p in
          guard let indexOf = pokePrediction.firstIndex(of: p) else { return }
          let pokemon = Pokemon.from(Int(indexOf + 1)) // adjust since numbers in `Pokemon` enum start with 1
          let confidence = p
          result.append(.init(pokemon: pokemon, confidence: confidence))
        }
        
        continuation.resume(returning: result)
      }
    }
  }
  
  private func handleCameraPreviews() async {
    guard let cameraModule: CameraSupporting = holder?.module() else { return }

    let imageStream = cameraModule.previewStream
      .map { image in
        self.imageToPredict = image
        return image.image
      }
    
    for await image in imageStream {
      Task { @MainActor in
        guard let image else { return }
        viewModel.viewfinderImage = image
      }
    }
  }
  
}


fileprivate extension CIImage {
  var uiImage: UIImage? {
    return UIImage(ciImage: self)
  }
  
  var image: Image? {
    let ciContext = CIContext()
    guard let cgImage = ciContext.createCGImage(self, from: self.extent) else { return nil }
    return Image(decorative: cgImage, scale: 1, orientation: .up)
  }
}
