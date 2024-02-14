//
//  
//  CameraBuilder.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/14/24.
//
//

import Foundation
import HuddleArch

public protocol CameraBuilding: ViewBuilding, ModuleBuilder {}

public struct CameraBuilder: CameraBuilding {
  public func buildRouter<T, R>(component: T) -> R? where T : ViewComponent, R : Routing {
    guard let c = component as? CameraViewComponent else { return nil }
    return CameraRouter(component: c) as? R
  }
  
  public func build(parentComponent: Component, holder: ModuleHolding?, context: RootModuleHolderContext) -> CameraModule {
      let component = CameraModuleComponentImpl(parent: parentComponent)
      let module = CameraModule(holder: holder, context: context, component: component)

      let viewComponent = CameraViewComponentImpl(module: module, moduleHolder: holder)
      module.router = buildRouter(component: viewComponent)
      
      return module
  }
}

