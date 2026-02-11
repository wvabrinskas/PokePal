//
//  
//  WebModule.swift
//  PokePal
//
//  Created by William Vabrinskas on 5/31/24.
//
//

import Foundation
import HuddleArch
import WebKit

public protocol WebModuleComponent: Component {
  // add dependencies here
}

public class WebModuleComponentImpl: Component, WebModuleComponent {
  // implement dependencies here

  public override init(parent: Component?) {
    super.init(parent: parent)
  }
}

public protocol WebSupporting: WKNavigationDelegate, WKUIDelegate {
  var viewModel: WebViewModel { get }
  
  func updateResult(_ result: ShowWebObject)
}

public final class WebModule: ModuleObject<RootModuleHolderContext, WebModuleComponentImpl,  WebRouter>, WebSupporting {
  public var viewModel: WebViewModel = WebViewModel()

  public required init(holder: ModuleHolding?, context: Context, component: WebModuleComponentImpl) {
    super.init(holder: holder, context: context, component: component)
    
    viewModel.webView.navigationDelegate = self
    viewModel.webView.uiDelegate = self
  }
  
  public func updateResult(_ result: ShowWebObject) {
    viewModel.result = result
  }
  
  // MARK: - WKNavigationDelegate
  
  public func webView(_ webView: WKWebView,
                      createWebViewWith configuration: WKWebViewConfiguration,
                      for navigationAction: WKNavigationAction,
                      windowFeatures: WKWindowFeatures) -> WKWebView? {
    viewModel.webView.load(navigationAction.request)
    return nil
  }
  
  public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction) async -> WKNavigationActionPolicy {
    guard let url = navigationAction.request.url,
          let host = url.host(),
          (host == Pokemon.baseHost || url.absoluteString.contains("q=https://\(Pokemon.baseHost)")) else {
      return .cancel
    }

    return .allow
  }
}
