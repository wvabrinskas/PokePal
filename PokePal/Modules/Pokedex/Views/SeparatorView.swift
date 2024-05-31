//
//  SeparatorView.swift
//  PokePal
//
//  Created by William Vabrinskas on 5/31/24.
//

import SwiftUI

struct SeparatorView: View {
  let edges: Edge.Set
  let padding: CGFloat
  
    var body: some View {
      Rectangle()
        .foregroundStyle(Gradient(colors: [.black.opacity(0.2), .white.opacity(0.2)]))
        .frame(height: 5)
        .shadow(color: .black, radius: 5, x: 0, y: 5)
        .padding(edges, padding)
    }
}

#Preview {
  SeparatorView(edges: .top, padding: 16)
}
