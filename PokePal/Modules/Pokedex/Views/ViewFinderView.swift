//
//  ViewFinderView.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/12/24.
//

import Foundation
import SwiftUI

struct ViewfinderView: View {
  var image: Image?
  
  var body: some View {
    if let image = image {
      GeometryReader { geometry in
        image
          .resizable()
          .scaledToFill()
          .frame(width: geometry.size.width, height: geometry.size.height)
      }
    } else {
      LoadingView(fontSize: 20)
        .padding()
        .align(.center)
        .padding(.bottom, 32)
    }

  }
}

struct ViewfinderView_Previews: PreviewProvider {
  static var previews: some View {
    ViewfinderView(image: Image("pokeball"))
      .frame(width: 64 * 5, height: 64 * 5)
      .preview()
    
    ViewfinderView(image: nil)
      .frame(width: 64 * 5, height: 64 * 5)
      .preview()
  }
}
