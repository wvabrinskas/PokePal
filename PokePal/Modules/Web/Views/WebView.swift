//
//  
//  WebView.swift
//  PokePal
//
//  Created by William Vabrinskas on 5/31/24.
//
//

import Foundation
import SwiftUI
import HuddleArch

public struct WebView: View {
  let router:  WebRouting
  var module: any WebSupporting
  var moduleHolder: ModuleHolding?

  @State var viewModel: WebViewModel

  public var body: some View {
    VStack {
      SeparatorView(edges: .bottom, padding: 16)
      WebResultView(viewModel: .init(result: viewModel.result,
                                     webView: viewModel.webView))
      .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
      .overlay(
        RoundedRectangle(cornerRadius: 15)
          .stroke(Gradient(colors: [.red.opacity(0.7), .red]), lineWidth: 4)
          .shadow(color: Color.black.opacity(0.5),
                  radius: 3, x: 5, y: 5)
          .clipShape(RoundedRectangle(cornerRadius: 15))
          .shadow(color: Color.black, radius: 2, x: -2, y: -2)
          .clipShape(RoundedRectangle(cornerRadius: 15) )
      )
      .padding([.leading, .trailing], 16)
    }
    .background(Gradient(colors: [.red.opacity(0.7), .red]))
    .fullscreen()
  }
}

struct WebView_Previews: PreviewProvider {
  static let context = RootModuleHolderContext()
  static let rootComponent =  RootComponentImpl()
  static let moduleHolder = RootModuleHolder(context: context, component: rootComponent)

  static let module = WebBuilder.build(parentComponent: rootComponent, holder: moduleHolder, context: context)

  static var previews: some View {
    module.router!.rootView()
      .preview()
  }
}
