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
import Combine

public protocol RootComponent: Component {
  
}

public final class RootComponentImpl: Component, RootComponent {
  public override init(parent: Component? = nil) {
    super.init(parent: parent)
  }
}

public final class RootModuleHolderContext: ModuleHolderContext {
}

public protocol RootSupporting: ModuleHolding {
  var ready: AnyPublisher<Bool, Never> { get }
  @MainActor func bootstrap()
}

public final class RootModuleHolder: ModuleHolder, Module, RootSupporting {
  public var ready: AnyPublisher<Bool, Never> {
    $readySubject
      .eraseToAnyPublisher()
  }
  public typealias Component = RootComponent
  public typealias Context = RootModuleHolderContext
  public typealias Router = RootRouter
    
  public var router: Router?
  private let component: RootComponent
  private let context: RootModuleHolderContext
  @Published
  private var readySubject: Bool = false

  public required init(holder: ModuleHolding? = nil, context: Context, component: Component) {
    self.component = component
    self.context = context
    super.init(holder: holder)
  }
  
  @MainActor
  public func bootstrap() {
    supportedModules = [
      PokedexBuilder.build(parentComponent: component, // Camera needs to be before since pokedex relies on it on init. We should add a `onActive` or something
                             holder: self,
                             context: context),
      CameraBuilder.build(parentComponent: component,
                            holder: self,
                            context: context),
      WebBuilder.build(parentComponent: component,
                         holder: self,
                         context: context)]
    
    readySubject = true
  }
  
  public func onActive() {
    // no op
  }
}
