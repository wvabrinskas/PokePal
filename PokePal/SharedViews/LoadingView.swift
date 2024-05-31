//
//  LoadingView.swift
//  PokePal
//
//  Created by William Vabrinskas on 5/31/24.
//

import SwiftUI

public struct LoadingView: View {
  public let fontSize: CGFloat
  private let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
  private let dotTimer = Timer.publish(every: 0.64, on: .main, in: .common).autoconnect()
  private let rotationTimer = Timer.publish(every: 0.7, on: .main, in: .common).autoconnect()

  @State private var opacity: CGFloat = 1.0
  @State private var dots: String = ""
  @State private var rotationAngle: CGFloat = 0

  public var body: some View {
    VStack {
      Image("pokeball-8bit")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 64, height: 64)
        .rotationEffect(.degrees(rotationAngle), anchor: .bottom)
        .animation(.smooth, value: rotationAngle)
        .padding(.bottom, 16)

      Text("Booting" + dots)
        .font(.pressStart(size: fontSize))
        .foregroundStyle(Color.white)
        .opacity(opacity)
        .animation(.smooth, value: opacity)
        .onReceive(timer) { input in
          opacity = opacity == 1.0 ? 0.6 : 1.0
        }
        .onReceive(dotTimer) { input in
          if dots == "..." {
            dots = ""
          } else {
            dots += "."
          }
        }
        .align(.center)
    }
    .onReceive(rotationTimer, perform: { _ in
      if rotationAngle == 0 {
        rotationAngle = 10
      }
      
      rotationAngle *= -1
    })
    
  }
}

struct LoadingView_Previews: PreviewProvider {
  static var previews: some View {
    LoadingView(fontSize: 20)
      .preview()
  }
}
