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

public protocol RootBuilding: ViewBuilding, ModuleBuilder {}

public struct RootBuilder: RootBuilding {
  public func buildRouter<T, R>(component: T) -> R? where T : ViewComponent, R : Routing {
    guard let c = component as? RootViewComponent else { return nil }
    return RootRouter(component: c) as? R
  }
  
  public func build(parentComponent: Component, holder: ModuleHolding?, context: RootModuleHolderContext) -> RootModuleHolder {
      let component = RootComponentImpl(parent: parentComponent)
      let module = RootModuleHolder(holder: holder, context: context, component: component)

      let viewComponent = RootViewComponentImpl(module: module, moduleHolder: holder)
      module.router = buildRouter(component: viewComponent)
      
      return module
  }
}

