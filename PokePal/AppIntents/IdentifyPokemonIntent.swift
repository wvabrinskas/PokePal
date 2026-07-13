//
//  IdentifyPokemonIntent.swift
//  PokePal
//
//  Exposes PokePal's on-device classifier to Shortcuts and Siri. The intent
//  takes an image, runs inference entirely in the background (the app never
//  launches), and returns the identified Pokémon's name.
//

import AppIntents
import UIKit

struct IdentifyPokemonIntent: AppIntent {
  static var title: LocalizedStringResource = "Identify Pokémon"
  static var description = IntentDescription(
    "Identifies the Pokémon in an image using PokePal's on-device model."
  )

  // Run the whole thing inside the Shortcut — never bring the app to the foreground.
  static var openAppWhenRun: Bool = false

  @Parameter(title: "Image",
             description: "The image to identify.",
             supportedContentTypes: [.image])
  var image: IntentFile

  static var parameterSummary: some ParameterSummary {
    Summary("Identify the Pokémon in \(\.$image)")
  }

  func perform() async throws -> some IntentResult & ReturnsValue<String> & ProvidesDialog {
    let imageData = image.data

    // Model load + inference is heavy; keep it off the main thread.
    let results = await Task.detached(priority: .userInitiated) { () -> [PokemonResult] in
      guard let uiImage = UIImage(data: imageData) else { return [] }
      return PokemonClassifier.shared.predict(image: uiImage)
    }.value

    guard let top = results.first, top.pokemon != .unknown else {
      throw IdentifyPokemonError.noMatch
    }

    let name = top.pokemon.name()
    let percent = Int((top.confidence * 100).rounded())
    let dialog = IntentDialog("It's \(name)! I'm \(percent)% sure.")

    return .result(value: name, dialog: dialog)
  }
}

enum IdentifyPokemonError: Error, CustomLocalizedStringResourceConvertible {
  case invalidImage
  case noMatch

  var localizedStringResource: LocalizedStringResource {
    switch self {
    case .invalidImage: return "That file isn't a readable image."
    case .noMatch: return "I couldn't identify a Pokémon in that image."
    }
  }
}

struct PokePalShortcuts: AppShortcutsProvider {
  static var appShortcuts: [AppShortcut] {
    AppShortcut(
      intent: IdentifyPokemonIntent(),
      phrases: [
        "Identify a Pokémon with \(.applicationName)",
        "Who's that Pokémon with \(.applicationName)"
      ],
      shortTitle: "Identify Pokémon",
      systemImageName: "camera.viewfinder"
    )
  }
}
