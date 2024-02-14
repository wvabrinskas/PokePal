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
    GeometryReader { geometry in
      if let image = image {
        image
          .resizable()
          .scaledToFill()
          .frame(width: geometry.size.width, height: geometry.size.height)
      }
    }
  }
}

//struct ViewfinderView_Previews: PreviewProvider {
//  static var previews: some View {
//    ViewfinderView(image: .constant(Image(systemName: "pencil")))
//  }
//}
