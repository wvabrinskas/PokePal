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
      Button {
        viewModel.takingPhotos.wrappedValue = false
        dismiss()
      } label: {
        HStack {
          Image(systemName: "xmark")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 15)
            .foregroundColor(.white)
            .bold()
            .offset(y: 2)
          Text("stop")
            .foregroundStyle(Color.white)
            .font(.title)
            .fontDesign(.rounded)
            .fontWeight(.bold)
        }
        .padding(8)
        .frame(width: 100, height: 50)
        .background(RoundedRectangle(cornerRadius: 25, style: .continuous).foregroundStyle(Color.red))
      }
      .padding(.top, 16)
      .isHidden(viewModel.showStop == false, remove: true)
      List {
        ForEach(0..<viewModel.results.count, id: \.self) { index in
          let pokemon = viewModel.results[index]
          HStack {
            Text(pokemon.pokemon.name().replacingOccurrences(of: "_", with: " "))
              .font(.system(size: index == 0 ? 25 : 22))
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
}

#Preview {
  ResultsView(viewModel: .init(results: [.init(pokemon: .mew, confidence: 0.8),
                                         .init(pokemon: .blastoise, confidence: 0.2), 
    .init(pokemon: .charizard, confidence: 0.1)], takingPhotos: .constant(true)), onTap: { _ in })
  .preferredColorScheme(.dark)
  .presentationBackground(.ultraThinMaterial)
}
