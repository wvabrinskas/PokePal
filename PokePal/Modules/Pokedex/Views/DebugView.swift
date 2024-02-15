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
  
  var body: some View {
    VStack {
      Text("last image")
      viewModel.inferenceImage?
        .resizable()
        .frame(width: 64 * 4.7, height: 64 * 4.7)
    }
  }
}

#Preview {
  DebugView(viewModel: .init(inferenceImage: .init(.pokeball)))
}
