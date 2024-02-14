//
//  
//  RootRouter.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/12/24.
//
//

import Foundation
import SwiftUI
import Logger
import HuddleArch

public protocol RootViewComponent: ViewComponent {
  var module: RootSupporting { get }
}

public struct RootViewComponentImpl: RootViewComponent {
  public var module: RootSupporting
  public var moduleHolder: ModuleHolding?
}

public protocol RootRouting: Routing {
  func routeToPokedexView() -> any View
}

public class RootRouter: RootRouting, Logger {
  public var logLevel: LogLevel = .high
  private let moduleHolder: ModuleHolding?
  private let component: RootViewComponent
  
  public init(component: RootViewComponent) {
    self.component = component
    self.moduleHolder = component.moduleHolder
  }
  
  public func rootView() -> any View {
    RootView(router: self, module: component.module, moduleHolder: component.moduleHolder)
  }
  
  public func routeToPokedexView() -> any View {
    guard let pokedex: PokedexRouting = moduleHolder?.router(for: PokedexSupporting.self) else {
      return Text("error").asAnyView()
    }
    
    return pokedex.rootView()
  }
}
