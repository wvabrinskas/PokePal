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
import HuddleMacros

public protocol CameraBuilding: ViewBuilding, ModuleBuilder {}

@Building(CameraRouter.self, CameraViewComponentImpl.self)
public struct CameraBuilder: CameraBuilding {
  public static func build(parentComponent: Component, holder: ModuleHolding?, context: RootModuleHolderContext) -> CameraModule {
      let component = CameraModuleComponentImpl(parent: parentComponent)
      let module = CameraModule(holder: holder, context: context, component: component)

      let viewComponent = CameraViewComponentImpl(module: module, moduleHolder: holder)
      module.router = buildRouter(component: viewComponent)
      
      return module
  }
}

