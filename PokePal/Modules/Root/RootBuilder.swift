//
//  
//  RootBuilder.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/12/24.
//
//

import Foundation
import HuddleArch
import HuddleMacros

public protocol RootBuilding: ViewBuilding, ModuleBuilder {}

@Building(RootRouter, RootViewComponentImpl)
public struct RootBuilder: RootBuilding {
  public static func build(parentComponent: Component, holder: ModuleHolding?, context: RootModuleHolderContext) -> RootModuleHolder {
      let component = RootComponentImpl(parent: parentComponent)
      let module = RootModuleHolder(holder: holder, context: context, component: component)

      let viewComponent = RootViewComponentImpl(module: module, moduleHolder: holder)
      module.router = buildRouter(component: viewComponent)
      
      return module
  }
}

