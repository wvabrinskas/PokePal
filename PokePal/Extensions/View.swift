//
//  View.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/12/24.
//

import Foundation
import SwiftUI


struct HuddlePreviewProvider: ViewModifier {
  public func body(content: Content) -> some View {
    content
      .fullscreen()
      .iphone14ProMaxPreview()
    
    content
      .fullscreen()
      .iphoneSEPreview()
  }
}


public extension View {
  
  func fullscreen() -> some View {
    self.frame(maxWidth: .infinity, maxHeight: .infinity)
      .preferredColorScheme(.dark)
  }
  
  func listen<T>(to: AsyncStream<T>?,
                 detached: Bool = false,
                 _ perform: @escaping (_ item: T) -> ()) -> some View {
    guard let to else { return self }

    if detached {
      Task.detached {
        for await item in to {
          perform(item)
        }
      }
    } else {
      Task {
        for await item in to {
          perform(item)
        }
      }
    }

    return self
  }
  
  func preview() -> AnyView {
    self.modifier(HuddlePreviewProvider())
      .asAnyView()
  }
  
  func iphoneSEPreview() -> some View {
    self
      .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
      .previewDisplayName("iPhone SE (3rd generation)")
  }
  
  func iphone14ProMaxPreview() -> some View {
    self
      .previewDevice(PreviewDevice(rawValue: "iPhone 15 Pro Max"))
      .previewDisplayName("iPhone 15 Pro Max")
  }
  
  @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
    if hidden {
      if !remove {
        self.hidden()
      }
    } else {
      self
    }
  }
  
  func asAnyView() -> AnyView {
    AnyView(self)
  }
}
