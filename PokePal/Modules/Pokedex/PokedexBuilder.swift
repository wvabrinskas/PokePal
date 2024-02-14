//
//  
//  PokedexBuilder.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/12/24.
//
//

import Foundation
import HuddleArch

public protocol PokedexBuilding: ViewBuilding, ModuleBuilder {}

public struct PokedexBuilder: PokedexBuilding {
  public func buildRouter<T, R>(component: T) -> R? where T : ViewComponent, R : Routing {
    guard let c = component as? PokedexViewComponent else { return nil }
    return PokedexRouter(component: c) as? R
  }
  
  public func build(parentComponent: Component, holder: ModuleHolding?, context: RootModuleHolderContext) -> PokedexModule {
      let component = PokedexModuleComponentImpl(parent: parentComponent)
      let module = PokedexModule(holder: holder, context: context, component: component)

      let viewComponent = PokedexViewComponentImpl(module: module, moduleHolder: holder)
      module.router = buildRouter(component: viewComponent)
      
      return module
  }
}

