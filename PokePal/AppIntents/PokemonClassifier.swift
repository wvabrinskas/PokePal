//
//  PokemonClassifier.swift
//  PokePal
//
//  A standalone, UI-independent wrapper around the bundled `.smodel` classifier.
//  Mirrors the inference pipeline in `PokedexModule` so it can be reused outside
//  the camera flow (for example, from an App Intent / Shortcut).
//

import Foundation
import UIKit
import CoreImage
import Neuron

public final class PokemonClassifier {

  /// Shared instance so the (relatively expensive) model load is reused across
  /// invocations within a process.
  public static let shared = PokemonClassifier()

  private let modelName: String
  private var sequential: Sequential?

  public init(modelName: String = "pokemon_v4") {
    self.modelName = modelName
  }

  /// Lazily imports and compiles the network the first time it's needed.
  private func loadModelIfNeeded() {
    guard sequential == nil else { return }
    guard let url = Bundle.main.url(forResource: modelName, withExtension: "smodel") else { return }

    let sequential = Sequential.import(url)
    sequential.compile()
    sequential.isTraining = false
    self.sequential = sequential
  }

  /// Runs classification on an arbitrary image and returns the top three matches,
  /// most confident first. Applies the same contrast/sharpen preprocessing the
  /// camera flow uses so results are consistent with the in-app experience.
  ///
  /// - Note: This is synchronous and does non-trivial work (model load + inference).
  ///   Call it off the main thread.
  public func predict(image: UIImage,
                      imageProperties: ImageProperties = ImageProperties(sharpness: 0.8, contrast: 1.0)) -> [PokemonResult] {
    loadModelIfNeeded()
    guard let sequential else { return [] }

    guard let resized = image.resizeImage(targetSize: CGSize(width: 64, height: 64)) else {
      return []
    }

    // `reverse: true` because the pixel data is BGR, not RGB.
    let imageTensor = resized.asRGBTensor(zeroCenter: imageProperties.zeroCenter, reverse: true)

    let prediction = sequential.predict(imageTensor, context: .init()).storage
    let podium = prediction.sorted(by: { $0 > $1 }).prefix(3)

    var results: [PokemonResult] = []
    for confidence in podium {
      guard let index = prediction.firstIndex(of: confidence) else { continue }
      // The `Pokemon` enum is 1-indexed, so adjust the model output index.
      let pokemon = Pokemon.from(Int(index + 1))
      results.append(PokemonResult(pokemon: pokemon, confidence: confidence))
    }

    return results
  }
}
