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
import HuddleMacros

public protocol PokedexBuilding: ViewBuilding, ModuleBuilder {}

@Building(PokedexRouter.self, PokedexViewComponentImpl.self)
public struct PokedexBuilder: PokedexBuilding {
  public static func build(parentComponent: Component, holder: ModuleHolding?, context: RootModuleHolderContext) -> PokedexModule {
      let component = PokedexModuleComponentImpl(parent: parentComponent)
      let module = PokedexModule(holder: holder, context: context, component: component)

      let viewComponent = PokedexViewComponentImpl(module: module, moduleHolder: holder)
      module.router = buildRouter(component: viewComponent)
      
      return module
  }
}

