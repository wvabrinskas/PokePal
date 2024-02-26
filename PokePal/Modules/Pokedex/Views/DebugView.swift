//
//  DebugView.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/14/24.
//

import SwiftUI

@Observable
public class DebugViewModel {
  var inferenceImage: Image?
  
  init(inferenceImage: Image? = nil) {
    self.inferenceImage = inferenceImage
  }
}

struct DebugView: View {
  
  let viewModel: DebugViewModel
  @Binding var imageProperties: ImageProperties
  
  var body: some View {
    VStack {
      Text("last image")
      viewModel.inferenceImage?
        .resizable()
        .frame(width: 64 * 4.7, height: 64 * 4.7)
      
      Text("Contrast - \(String(format: "%.1f", imageProperties.contrast))")
      Slider(value: $imageProperties.contrast, in: 0...5)
        .padding([.leading, .trailing])
        .padding(.bottom, 16)
      
      Text("Sharpness - \(String(format: "%.1f", imageProperties.sharpness))")
      Slider(value: $imageProperties.sharpness, in: 0...5)
        .padding([.leading, .trailing])
    }
  }
}

#Preview {
  DebugView(viewModel: .init(inferenceImage: .init(.pokeball)),
            imageProperties: .constant(.init(sharpness: 0.8,
                                             contrast: 1.5)))
}
