//
//  
//  WebRouter.swift
//  PokePal
//
//  Created by William Vabrinskas on 5/31/24.
//
//

import Foundation
import SwiftUI
import Logger
import HuddleArch

public protocol WebViewComponent: ViewComponent {
  var module: WebSupporting { get }
}

public struct WebViewComponentImpl: WebViewComponent {
  public var module: WebSupporting
  public var moduleHolder: ModuleHolding?
}

public protocol WebRouting: Routing {}

public class WebRouter: WebRouting, Logger {
  public var logLevel: LogLevel = .high
  private let moduleHolder: RootModuleHolder?
  private let component: WebViewComponent
  
  public init(component: WebViewComponent) {
    self.component = component
    self.moduleHolder = component.moduleHolder as? RootModuleHolder
    if moduleHolder == nil {
      log(type: .message, message: "No valid ModuleHolder to be found in \(#file)")
    }
  }
  
  public func rootView() -> any View {
    WebView(router: self, module: component.module, 
            moduleHolder: component.moduleHolder,
            viewModel: component.module.viewModel)
  }
}
