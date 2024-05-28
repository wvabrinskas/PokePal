//
//  DimpleView.swift
//  PokePal
//
//  Created by William Vabrinskas on 5/28/24.
//

import SwiftUI

struct DimpleView: View {
    var body: some View {
      Rectangle()
        .fill(Gradient(colors: [.red.opacity(0.7), .red]))
        .layerEffect(ShaderLibrary.dimple(), maxSampleOffset: .zero)
        .fullscreen()
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
  DimpleView()
    .preview()
}
