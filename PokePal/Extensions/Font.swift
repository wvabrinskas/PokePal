//
//  Font.swift
//  PokePal
//
//  Created by William Vabrinskas on 5/31/24.
//

import Foundation
import SwiftUI

public extension Font {
  static func pressStart(size: CGFloat) -> Font {
    
    let fontName = "PressStart2p-Regular"
    
    guard let customFont = UIFont(name: fontName, size: size) else {
      return .system(size: size, weight: .regular, design: .rounded)
    }
    
    return Font(customFont)
  }
}
