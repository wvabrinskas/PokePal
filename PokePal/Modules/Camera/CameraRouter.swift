//
//  
//  CameraRouter.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/14/24.
//
//

import Foundation
import SwiftUI
import Logger
import HuddleArch
import UIKit

public protocol CameraViewComponent: ViewComponent {
  var module: CameraSupporting { get }
}

public struct CameraViewComponentImpl: CameraViewComponent {
  public var module: CameraSupporting
  public var moduleHolder: ModuleHolding?
}

public protocol CameraRouting: Routing {}

public class CameraRouter: CameraRouting, Logger {
  public var logLevel: LogLevel = .high
  private let moduleHolder: RootModuleHolder?
  private let component: CameraViewComponent
  
  public init(component: CameraViewComponent) {
    self.component = component
    self.moduleHolder = component.moduleHolder as? RootModuleHolder
    if moduleHolder == nil {
      log(type: .message, message: "No valid ModuleHolder to be found in \(#file)")
    }
  }
  
  public func rootView() -> any View {
    CameraView(router: self, module: component.module, moduleHolder: component.moduleHolder)
  }
}
