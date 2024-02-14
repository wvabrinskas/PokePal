//
//
//  RootModule.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/12/24.
//
//

import Foundation
import HuddleArch

public protocol RootComponent: Component {
  
}

public final class RootComponentImpl: Component, RootComponent {
  public override init(parent: Component? = nil) {
    super.init(parent: parent)
  }
}

public final class RootModuleHolderContext: ModuleHolderContext {
}

public protocol RootSupporting {}

public final class RootModuleHolder: ModuleHolder, Module, RootSupporting {
  public typealias Component = RootComponent
  public typealias Context = RootModuleHolderContext
  public typealias Router = RootRouter
    
  public var router: Router?
  
  public required init(holder: ModuleHolding? = nil, context: Context, component: Component) {
    super.init(holder: holder)
    
    self.router = RootRouter(component: RootViewComponentImpl(module: self,
                                                              moduleHolder: self))
    
    supportedModules = [
      PokedexBuilder().build(parentComponent: component, // Camera needs to be before since pokedex relies on it on init. We should add a `onActive` or something
                             holder: self,
                             context: context),
      CameraBuilder().build(parentComponent: component,
                            holder: self,
                            context: context)]
  }
  
  public func onActive() {
    // no op
  }
}
