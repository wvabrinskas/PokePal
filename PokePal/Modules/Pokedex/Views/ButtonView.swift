//
//  ButtonView.swift
//  PokePal
//
//  Created by William Vabrinskas on 5/27/24.
//

import SwiftUI

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
        .stroke(Gradient(colors: [.white.opacity(0.5), viewModel.color]), lineWidth: 2)
        .frame(width: viewModel.size.width, height: viewModel.size.height)
        .overlay {
          viewModel.image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: viewModel.size.height * 0.75, height: viewModel.size.height * 0.75)
            .foregroundColor(.white)
        }
    }
    .compositingGroup()
    .shadow(color: .black.opacity(0.5), radius: 5, x: 0.0, y: 5)
  }
}

#Preview {
  ButtonView(viewModel: .init(size: CGSize(width: 120, height: 80),
                              color: .blue,
                              image: Image(systemName: "arrow.triangle.2.circlepath.camera"))) {}
    .preview()
}
