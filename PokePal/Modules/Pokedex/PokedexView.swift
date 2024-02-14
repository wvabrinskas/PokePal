//
//
//  PokedexView.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/12/24.
//
//

import Foundation
import SwiftUI
import HuddleArch
import AVFoundation

@Observable
final class PokedexViewModel {
  var viewfinderImage: Image?
  var ready: Bool
  var pokemon: [PokemonResult]
  
  public init(viewfinderImage: Image? = nil,
              ready: Bool = false,
              pokemon: [PokemonResult] = []) {
    self.viewfinderImage = viewfinderImage
    self.ready = ready
    self.pokemon = pokemon
  }
}

public struct PokedexView: View {
  let router:  PokedexRouting
  var module: any PokedexSupporting
  var moduleHolder: ModuleHolding?
  
  @State var viewModel: PokedexViewModel = .init()

  public var body: some View {
    ZStack {
      ViewfinderView(image: viewModel.viewfinderImage)
        .background(
          Image(.pokeball)
          .resizable())
        .frame(width: 64 * 4.7, height: 64 * 4.7)
        .offset(CGSize(width: 10, height: -48))
      Image(.pokedex)
        .resizable()
        .aspectRatio(contentMode: .fit)
      VStack {
        ForEach(viewModel.pokemon) { p in
          HStack {
            Text(p.pokemon.name())
              .foregroundColor(.white)
              .font(.system(size: 18))
            Text("\(String(format: "%.2f", p.confidence * 100))%")
              .foregroundColor(.white)
              .font(.system(size: 18))
          }
        }
        .padding()
        .background(Color.black)
        Spacer()
        Button {
          Task {
            viewModel.pokemon = await module.whosThatPokemon()
          }
        } label: {
          Text("capture")
            .foregroundColor(.black)
            .font(.system(size: 22))
            .bold()
            .padding()
        }
        .disabled(viewModel.ready == false)
        .background(Color.clear)
        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10),
                                    style: .continuous))
        .padding()
        .offset(CGSize(width: -26.0, height: -98.0))
      }
    }
    .fullscreen()
    .onReceive(module.viewFinderImage.receive(on: DispatchQueue.main)) { image in
      viewModel.viewfinderImage = image
    }
    .onReceive(module.ready.receive(on: DispatchQueue.main)) { ready in
      viewModel.ready = ready
    }
  }
}

struct PokedexView_Previews: PreviewProvider {
  static let context = RootModuleHolderContext()
  static let rootComponent =  RootComponentImpl()
  static let moduleHolder = RootModuleHolder(context: context, component: rootComponent)

  static let module = PokedexBuilder().build(parentComponent: rootComponent, holder: moduleHolder, context: context)

  static var previews: some View {
    module.router!.rootView()
      .preview()
  }
}
