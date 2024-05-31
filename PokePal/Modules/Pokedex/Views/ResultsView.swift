//
//  ResultsView.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/14/24.
//

import SwiftUI

public final class ResultsViewModel {
  let results: [PokemonResult]
  var showStop: Bool
  var takingPhotos: Binding<Bool>
  
  init(results: [PokemonResult] = [],
       takingPhotos: Binding<Bool>,
       showStop: Bool = false) {
    self.results = results
    self.takingPhotos = takingPhotos
    self.showStop = showStop
  }
}

struct ResultsView: View {
  @Environment(\.dismiss) var dismiss
  let viewModel: ResultsViewModel
  let onTap: (PokemonResult) -> ()
  
  var body: some View {
    VStack(spacing: 0) {
      SeparatorView(edges: .top, padding: 0)
      
      ButtonView(viewModel: .init(size: CGSize(width: 150,
                                               height: 40),
                                  color: .blue,
                                  image: Image(systemName: "stop.circle"))) {
        viewModel.takingPhotos.wrappedValue = false
        dismiss()
      }
      .isHidden(viewModel.showStop == false, remove: true)
      
      VStack(spacing: 24) {
        ForEach(0..<viewModel.results.count, id: \.self) { index in
          let pokemon = viewModel.results[index]
          HStack {
            Text(pokemon.pokemon.name().replacingOccurrences(of: "_", with: " "))
              .font(.pressStart(size: index == 0 ? 22 : 18))
              .bold(index == 0)
            Spacer()
            Text("\(String(format: "%.1f", pokemon.confidence * 100))%")
              .font(.pressStart(size: index == 0 ? 20 : 16))
              .bold(index == 0)
            Button {
              onTap(pokemon)
            } label: {
              Image(systemName: "chevron.right")
                .foregroundColor(.white)
                .padding(.leading, 8)
            }
          }
          .onTapGesture {
            onTap(pokemon)
          }
          .padding([.leading, .trailing], 21)
          .opacity(index == 0 ? 1.0 : 0.8)
        }
        Spacer()
      }
      .padding(.top, viewModel.showStop ? 16 : 32)
    }
    .background(Gradient(colors: [.red.opacity(0.7), .red]))
    .fullscreen()
  }
}

#Preview {
  ResultsView(viewModel: .init(results: [.init(pokemon: .mew, confidence: 0.8),
                                         .init(pokemon: .blastoise, confidence: 0.2), 
    .init(pokemon: .charizard, confidence: 0.1)], takingPhotos: .constant(true), showStop: true), onTap: { _ in })
  .preview()
}
