//
//  WebView.swift
//  UI-design-Demo
//
//  Created by RCXXX on 2021/3/12.
//

import SwiftUI
import WebKit

struct myWebView: UIViewRepresentable {
    var url: String
    var webView = WKWebView()
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }
        let request = URLRequest(url: url)
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<myWebView>) {
        
    }
}
