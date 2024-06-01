//
//  
//  WebViewModel.swift
//  PokePal
//
//  Created by William Vabrinskas on 5/31/24.
//
//

import Foundation
import SwiftUI
import HuddleArch
import WebKit

@Observable
public final class WebViewModel {
  let webView: WKWebView = .init()
  var result: ShowWebObject = .init(pokemon: .unknown)
}
