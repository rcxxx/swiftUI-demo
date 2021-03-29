//
//  ContentView.swift
//  Show-Web-Page
//
//  Created by RCXXX on 2021/3/9.
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

struct ContentView: View {
    let view = myWebView(url: "https://www.msn.cn/zh-cn/money/markets")
    
    var body: some View {
        self.view
            .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
