//
//  WebView.swift
//  PokePal
//
//  Created by William Vabrinskas on 2/14/24.
//

import SwiftUI
import WebKit

public final class WebResultViewModel {
  let result: ShowWebObject
  
  init(result: ShowWebObject) {
    self.result = result
  }
}

struct WebResultView: UIViewRepresentable {
  typealias UIViewType = WKWebView
  
  let viewModel: WebResultViewModel
  
  func makeUIView(context: Context) -> WKWebView {
    return WKWebView()
  }
  
  func updateUIView(_ webView: WKWebView, context: Context) {
    guard let url = viewModel.result.pokemon.url() else { return }
    let request = URLRequest(url: url)
    webView.load(request)
  }
}

#Preview {
  WebResultView(viewModel: .init(result: .init(pokemon: .mew)))
}
