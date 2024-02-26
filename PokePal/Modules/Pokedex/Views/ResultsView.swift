//
//  ResultsView.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/14/24.
//

import SwiftUI

public final class ResultsViewModel {
  let results: [PokemonResult]
  init(results: [PokemonResult] = []) {
    self.results = results
  }
}

struct ResultsView: View {
  let viewModel: ResultsViewModel
  let onTap: (PokemonResult) -> ()
  
  var body: some View {
    List {
      ForEach(0..<viewModel.results.count, id: \.self) { index in
        let pokemon = viewModel.results[index]
        HStack {
          Text(pokemon.pokemon.name())
            .font(.system(size: index == 0 ? 30 : 22))
            .fontDesign(.rounded)
            .fontWeight(index == 0 ? .heavy : .medium)
            .bold(index == 0)
          Spacer()
          Text("\(String(format: "%.1f", pokemon.confidence * 100))%")
            .font(.system(size: index == 0 ? 30 : 22))
            .fontDesign(.rounded)
            .fontWeight(index == 0 ? .heavy : .medium)
            .bold(index == 0)
          Button {
            onTap(pokemon)
          } label: {
            Image(systemName: "chevron.right")
              .foregroundColor(.white)
              .padding(.leading, 8)
          }
        }
        .opacity(index == 0 ? 1.0 : 0.8)
      }
      .listRowSpacing(0)
      .listRowInsets(.none)
      .listRowBackground(Color.clear)
      .listRowSeparator(.hidden)
    }
    .scrollContentBackground(.hidden)
  }
}

#Preview {
  ResultsView(viewModel: .init(results: [.init(pokemon: .mew, confidence: 0.8),
                                         .init(pokemon: .blastoise, confidence: 0.2), 
    .init(pokemon: .charizard, confidence: 0.1)]), onTap: { _ in })
  .preferredColorScheme(.dark)
  .presentationBackground(.ultraThinMaterial)
}
