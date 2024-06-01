//
//  ButtonView.swift
//  PokePal
//
//  Created by William Vabrinskas on 5/27/24.
//

import SwiftUI
import Metal

public struct ButtonViewModel {
  let size: CGSize
  let color: Color
  let image: Image
}

struct ButtonView: View {
  let viewModel: ButtonViewModel
  let action: () -> ()
  var body: some View {
    Button {
      action()
    } label: {
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(.white)
        .fill(Gradient(colors: [viewModel.color, viewModel.color.opacity(0.8)]))
        .stroke(Gradient(colors: [.white.opacity(0.3), viewModel.color]), lineWidth: 2)
        .frame(width: viewModel.size.width, height: viewModel.size.height)
        .overlay {
          viewModel.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: viewModel.size.width * 0.6, height: viewModel.size.height * 0.6)
            .foregroundStyle(viewModel.color)
            .layerEffect(ShaderLibrary.embossOut(.float(0.8)), maxSampleOffset: .zero)
            .layerEffect(ShaderLibrary.emboss(.float(0.5)), maxSampleOffset: .zero)
        }
    }
    .shadow(color: .white.opacity(0.1), radius: 3, x: 5, y: -5)
    .shadow(color: .black.opacity(0.2), radius: 3, x: -5, y: 5)
    .frame(width: viewModel.size.width + 20, height: viewModel.size.height + 20)
    .clipShape(
      RoundedRectangle(cornerRadius: 10, style: .continuous))
  }
}

#Preview {
  ButtonView(viewModel: .init(size: CGSize(width: 120, height: 80),
                              color: .blue,
                              image: Image(systemName: "arrow.triangle.2.circlepath.camera"))) {}
    .preview()
    .background(Color.red)
}
