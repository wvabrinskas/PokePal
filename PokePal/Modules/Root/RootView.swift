//
//
//  RootView.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/12/24.
//
//

import Foundation
import SwiftUI
import HuddleArch

public struct RootView: View {
  
  let router: RootRouting
  var module: any RootSupporting
  var moduleHolder: ModuleHolding?
  @State var view: AnyView = LoadingView(fontSize: 12).asAnyView()
  @State var ready: Bool = false
  
  public var body: some View {
    ZStack {
      LoadingView(fontSize: 12)
        .isHidden(!ready, remove: true)
      if ready {
        router.routeToPokedexView()
          .asAnyView()
      }
    }
    .fullscreen()
    .onAppear {
      module.bootstrap()
    }
    .onReceive(module.ready) { ready in
      self.ready = ready
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static let context = RootModuleHolderContext()
  static let rootComponent =  RootComponentImpl()
  static let moduleHolder = RootModuleHolder(holder: nil, context: context, component: rootComponent)
  
  static let module = RootBuilder.build(parentComponent: rootComponent, holder: moduleHolder, context: context)
  
  static var previews: some View {
    module.router!.rootView()
      .preview()
  }
}
