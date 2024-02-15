//
//
//  PokedexRouter.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/12/24.
//
//

import Foundation
import SwiftUI
import Logger
import HuddleArch

public protocol PokedexViewComponent: ViewComponent {
  var module: PokedexSupporting { get }
}

public struct PokedexViewComponentImpl: PokedexViewComponent {
  public var module: PokedexSupporting
  public var moduleHolder: ModuleHolding?
}

public protocol PokedexRouting: Routing {
  func routeToCameraView() -> any View
}

public class PokedexRouter: PokedexRouting, Logger {
  public var logLevel: LogLevel = .high
  private let moduleHolder: ModuleHolding?
  private let component: PokedexViewComponent
  
  public init(component: PokedexViewComponent) {
    self.component = component
    self.moduleHolder = component.moduleHolder
  }
  
  public func rootView() -> any View {
    PokedexView(router: self, module: component.module,
                moduleHolder: component.moduleHolder,
                viewModel: component.module.viewModel)
  }
  
  public func routeToCameraView() -> any View {
    guard let cameraRouter: CameraRouting = moduleHolder?.router(for: CameraSupporting.self) else {
      return Image(.pokeball)
    }
    
    return cameraRouter.rootView()
  }
}
