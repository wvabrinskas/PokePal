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
  var preProcess: Bool
  
  init(sharpness: Float,
       contrast: Float,
       preProcess: Bool = true) {
    self.sharpness = sharpness
    self.preProcess = preProcess
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
  var takingPhotos: Bool
  
  public init(viewfinderImage: Image? = nil,
              inferenceImage: Image? = nil,
              ready: Bool = false,
              pokemon: [PokemonResult] = [],
              showDebugMenu: Bool = false,
              showResultsMenu: Bool = false,
              showWebResult: ShowWebObject? = nil,
              imageProperties: ImageProperties,
              takingPhotos: Bool = false) {
    self.viewfinderImage = viewfinderImage
    self.ready = ready
    self.pokemon = pokemon
    self.showDebugMenu = showDebugMenu
    self.inferenceImage = inferenceImage
    self.showResultsMenu = showResultsMenu
    self.showWebResult = showWebResult
    self.imageProperties = imageProperties
    self.takingPhotos = takingPhotos
  }
}

public struct PokedexView: View {
  let router:  PokedexRouting
  var module: any PokedexSupporting
  var moduleHolder: ModuleHolding?
  
  @State var timer: Timer?
  @State var viewModel: PokedexViewModel
  
  public var body: some View {
    VStack {
      HStack(alignment: .top) {
        CircleView(viewModel: .init(size: 65, color: .blue, lineWidth: 7))
        Spacer()
          .frame(maxWidth: 30)
        HStack(spacing: 8) {
          CircleView(viewModel: .init(size: 20, color: .red, lineWidth: 3))
          CircleView(viewModel: .init(size: 20, color: .yellow, lineWidth: 3))
          CircleView(viewModel: .init(size: 20, color: .green, lineWidth: 3))
        }
        
        Spacer()
        Button {
          viewModel.showDebugMenu = true
        } label: {
          Image(systemName: "ladybug.fill")
            .foregroundColor(.white)
            .opacity(0.6)
        }
        .disabled(viewModel.ready == false)
        .frame(height: 5)
      }
      .padding([.leading, .trailing], 25)
      .padding(.top, 17)
      
      Spacer()
        .frame(maxHeight: 30)
      
      SeparatorView(edges: .bottom, padding: 16)
      
      ZStack {
        RoundedRectangle(cornerRadius: 25.0,
                                    style: .continuous)
        .fill(.white)
        .stroke(Gradient(colors: [.white.opacity(0.8), .black.opacity(0.2)]), lineWidth: 4)
        .frame(width: 64 * 5 + 80, height: 64 * 5 + 100)
        .shadow(color: .black.opacity(0.5), radius: 5, x: 0.0, y: 5)
        
        CircleView(viewModel: .init(size: 20, color: .red, lineWidth: 3))
          .padding(.leading, 35)
          .padding(.bottom, 13)
          .align(.bottomLeading)
        
        RoundedRectangle(cornerRadius: 25.0,
                                    style: .continuous)
        .fill(.black)
        .stroke(Gradient(colors: [.black.opacity(0.2), .white.opacity(0.2)]), lineWidth: 20)
        .frame(width: 64 * 5, height: 64 * 5)

        ViewfinderView(image: viewModel.viewfinderImage)
          .clipShape(RoundedRectangle(cornerRadius: 25.0,
                                      style: .continuous))
          .frame(width: 64 * 5, height: 64 * 5)
          .compositingGroup()
          .shadow(color: .black.opacity(0.5), radius: 10, x: 0.0, y: 5)
          .gesture(MagnifyGesture()
                      .onChanged { value in
                        module.pinchToZoom(value.velocity)
                      })
        
      }
      
      SeparatorView(edges: .top, padding: 16)

      Spacer()
        .frame(maxHeight: 100)
      
      HStack(spacing: 50) {
        Spacer()
        
        ButtonView(viewModel: .init(size: CGSize(width: 120, height: 80), 
                                    color: .blue,
                                    image: Image(systemName: "arrow.triangle.2.circlepath.camera"))) {
          startCapture()
        }
        .isHidden(viewModel.ready == false)
        .disabled(viewModel.ready == false)
        
        ButtonView(viewModel: .init(size: CGSize(width: 120, height: 80),
                                    color: .green,
                                    image: Image(systemName: "camera.viewfinder"))) {
          Task {
            await module.whosThatPokemon()
          }
        }
        .isHidden(viewModel.ready == false)
        .disabled(viewModel.ready == false)

        Spacer()
      }
      .padding(.bottom, 32)
      
      Spacer()
    }
    .background(Gradient(colors: [.red.opacity(0.7), .red]))
    .fullscreen()
    .onChange(of: viewModel.takingPhotos, { oldValue, newValue in
      if newValue == false {
        stopCapture()
      }
    })
    .sheet(item: $viewModel.showWebResult) { result in
      WebResultView(viewModel: .init(result: result))
    }
    .sheet(isPresented: $viewModel.showResultsMenu) {
      ResultsView(viewModel: .init(results: viewModel.pokemon,
                                   takingPhotos: $viewModel.takingPhotos,
                                   showStop: viewModel.takingPhotos)) { pokemon in
        viewModel.showResultsMenu = false
        viewModel.showWebResult = .init(pokemon: pokemon.pokemon)
      }
      .presentationDetents([.height(260)])
      .presentationCornerRadius(0)
    }
    .sheet(isPresented: $viewModel.showDebugMenu) {
      DebugView(viewModel: .init(inferenceImage: viewModel.inferenceImage),
                imageProperties: $viewModel.imageProperties)
    }
  }
  
  func startCapture() {
    viewModel.takingPhotos = true
    viewModel.showResultsMenu = true
    
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
      Task { @MainActor in
        if viewModel.takingPhotos {
          await module.whosThatPokemon()
        }
      }
    })
  }
  
  func stopCapture() {
    timer?.invalidate()
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
