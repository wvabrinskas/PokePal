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

public protocol WebBuilding: ViewBuilding, ModuleBuilder {}

public struct WebBuilder: WebBuilding {
  public func buildRouter<T, R>(component: T) -> R? where T : ViewComponent, R : Routing {
    guard let c = component as? WebViewComponent else { return nil }
    return WebRouter(component: c) as? R
  }
  
  public func build(parentComponent: Component, holder: ModuleHolding?, context: RootModuleHolderContext) -> WebModule {
      let component = WebModuleComponentImpl(parent: parentComponent)
      let module = WebModule(holder: holder, context: context, component: component)

      let viewComponent = WebViewComponentImpl(module: module, moduleHolder: holder)
      module.router = buildRouter(component: viewComponent)
      
      return module
  }
}

