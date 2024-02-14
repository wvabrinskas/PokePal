//
//  
//  CameraView.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/14/24.
//
//

import Foundation
import SwiftUI
import HuddleArch

public struct CameraView: UIViewControllerRepresentable {
  public typealias UIViewControllerType = CameraViewController

  let router: CameraRouting
  var module: any CameraSupporting
  var moduleHolder: ModuleHolding?
  
  public func makeUIViewController(context: Context) -> CameraViewController {
    module.cameraViewController
  }
  
  public func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {
    
  }

}

struct CameraView_Previews: PreviewProvider {
  static let context = RootModuleHolderContext()
  static let rootComponent =  RootComponentImpl()
  static let moduleHolder = RootModuleHolder(context: context, component: rootComponent)

  static let module = CameraBuilder().build(parentComponent: rootComponent, holder: moduleHolder, context: context)

  static var previews: some View {
    module.router!.rootView()
      .preview()
  }
}
