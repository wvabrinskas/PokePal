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

public struct ShowWebObject: Identifiable {
  public var id: Int { pokemon.rawValue }
  
  var pokemon: Pokemon
}

@Observable
public final class ImageProperties {
  var sharpness: Float
  var contrast: Float
  
  init(sharpness: Float, contrast: Float) {
    self.sharpness = sharpness
    self.contrast = contrast
  }
}

@Observable
public final class PokedexViewModel {
  var viewfinderImage: Image?
  var inferenceImage: Image?
  var ready: Bool
  var pokemon: [PokemonResult]
  var showDebugMenu: Bool
  var showResultsMenu: Bool
  var showWebResult: ShowWebObject?
  var imageProperties: ImageProperties
  
  public init(viewfinderImage: Image? = nil,
              inferenceImage: Image? = nil,
              ready: Bool = false,
              pokemon: [PokemonResult] = [],
              showDebugMenu: Bool = false,
              showResultsMenu: Bool = false,
              showWebResult: ShowWebObject? = nil,
              imageProperties: ImageProperties) {
    self.viewfinderImage = viewfinderImage
    self.ready = ready
    self.pokemon = pokemon
    self.showDebugMenu = showDebugMenu
    self.inferenceImage = inferenceImage
    self.showResultsMenu = showResultsMenu
    self.showWebResult = showWebResult
    self.imageProperties = imageProperties
  }
}

public struct PokedexView: View {
  let router:  PokedexRouting
  var module: any PokedexSupporting
  var moduleHolder: ModuleHolding?
  
  @State var viewModel: PokedexViewModel
  
  public var body: some View {
    VStack {
      HStack {
        Spacer()
        Button {
          viewModel.showDebugMenu = true
        } label: {
          Image(systemName: "ladybug.fill")
            .foregroundColor(.white)
            .padding()
            .opacity(0.6)
        }
        .disabled(viewModel.ready == false)
      }
      .frame(height: 5)
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
          .shadow(color: .black.opacity(0.4),
                  radius: 10)
      }
      HStack {
        Spacer()
        Button {
          Task {
            await module.whosThatPokemon()
          }
        } label: {
          Circle()
            .frame(width: 60, height: 60)
            .foregroundColor(.white)
            .overlay {
              Circle()
                .strokeBorder(style: .init(lineWidth: 2))
                .foregroundColor(.black.opacity(0.6))
                .frame(width: 50)
                  
            }
            .opacity(0.6)
        }
        .disabled(viewModel.ready == false)
        
        Spacer()
      }
      .padding(.bottom, 32)
    }
    .background(Image(.woods)
      .resizable()
      .blur(radius: 10)
      .ignoresSafeArea())
    .fullscreen()
    .sheet(item: $viewModel.showWebResult) { result in
      WebResultView(viewModel: .init(result: result))
    }
    .sheet(isPresented: $viewModel.showResultsMenu) {
      ResultsView(viewModel: .init(results: viewModel.pokemon)) { pokemon in
        viewModel.showResultsMenu = false
        viewModel.showWebResult = .init(pokemon: pokemon.pokemon)
      }
      .preferredColorScheme(.dark)
      .presentationBackground(.thinMaterial)
      .presentationDetents([.height(200)])
      .presentationCornerRadius(40)
    }
    .sheet(isPresented: $viewModel.showDebugMenu) {
      DebugView(viewModel: .init(inferenceImage: viewModel.inferenceImage),
                imageProperties: $viewModel.imageProperties)
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
