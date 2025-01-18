//
//  
//  WebBuilder.swift
//  PokePal
//
//  Created by William Vabrinskas on 5/31/24.
//
//

import Foundation
import HuddleArch
import HuddleMacros

public protocol WebBuilding: ViewBuilding, ModuleBuilder {}

@Building(WebRouter, WebViewComponentImpl)
public struct WebBuilder: WebBuilding {
  public static func build(parentComponent: Component, holder: ModuleHolding?, context: RootModuleHolderContext) -> WebModule {
      let component = WebModuleComponentImpl(parent: parentComponent)
      let module = WebModule(holder: holder, context: context, component: component)

      let viewComponent = WebViewComponentImpl(module: module, moduleHolder: holder)
      module.router = buildRouter(component: viewComponent)
      
      return module
  }
}

