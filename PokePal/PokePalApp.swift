//
//  PokePalApp.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/10/24.
//

import SwiftUI

@main
struct PokePalApp: App {
  @Environment(\.rootModule) var rootModule
  var body: some Scene {
    WindowGroup {
      rootModule.router?
        .rootView()
        .asAnyView()
    }
  }
}
