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
  let webView: WKWebView
  
  init(result: ShowWebObject,
       webView: WKWebView) {
    self.result = result
    self.webView = webView
  }
}

struct WebResultView: UIViewRepresentable {
  typealias UIViewType = WKWebView
  
  let viewModel: WebResultViewModel
  
  func makeUIView(context: Context) -> WKWebView {
    let view = viewModel.webView
    return view
  }
  
  func updateUIView(_ webView: WKWebView, context: Context) {
    guard let url = viewModel.result.pokemon.url() else { return }
      
    Task {
      var request = URLRequest(url: url)

      do {
        let session = URLSession.shared
        let result = try await session.data(for: request)
        
        if let response = result.1 as? HTTPURLResponse {
          if response.statusCode == 404,
              let searchUrl = viewModel.result.pokemon.searchUrl() {
            
            request = URLRequest(url: searchUrl)
          }
        }
      } catch {
        print(error.localizedDescription)
      }

      webView.load(request)
    }
    
  }
}

#Preview {
  WebResultView(viewModel: .init(result: .init(pokemon: .mew), webView: .init()))
}
