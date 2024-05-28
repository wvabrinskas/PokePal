//
//  CircleView.swift
//  PokePal
//
//  Created by William Vabrinskas on 5/27/24.
//

import SwiftUI

public struct CircleViewModel {
  var size: CGFloat
  var color: Color
  var lineWidth: CGFloat
}

struct CircleView: View {
  let viewModel: CircleViewModel
  var body: some View {
    Circle()
      .stroke(Gradient(colors: [.white, viewModel.color]),
              lineWidth: viewModel.lineWidth)
      .fill(viewModel.color)
      .frame(width: viewModel.size)
      .overlay {
        Circle()
          .fill(RadialGradient(gradient: Gradient(colors: [.white.opacity(0.5), .clear]), center: .init(x: 0.7, y: 0.2), startRadius: 5, endRadius: 40))
      }
      .shadow(color: .white.opacity(0.1), radius: 3, x: 5, y: -5)
      .shadow(color: .black.opacity(0.2), radius: 3, x: -5, y: 5)
      .frame(width: viewModel.size + 10, height: viewModel.size + 10)
      .clipShape(
        Circle()
      )
  }
}

#Preview {
  CircleView(viewModel: .init(size: 80, color: .blue, lineWidth: 7))
    .preview()
    .background(Color.red)
}
