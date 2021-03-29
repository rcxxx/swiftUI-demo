//
//  ContentView.swift
//  ScreenShot-Demo
//
//  Created by RCXXX on 2021/3/10.
//

import Foundation
import SwiftUI
import WebKit
import SwViewCapture

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
    
    func takescreenShot (_ shouldSave: Bool = false) -> UIImage? {
        var screenshotImage: UIImage?
        
        webView.swCapture { (capturedImage) -> Void in
            screenshotImage = capturedImage
        }
        
        if let image = screenshotImage, shouldSave {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
        
        return screenshotImage
    }
    

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<myWebView>) {}
}

struct ContentView: View {
    let view = myWebView(url: "https://ditu.amap.com")
    
    @State var screenshotImage: UIImage? = nil
    
    var body: some View {
        VStack() {
            view.ignoresSafeArea()
                .padding()
            
            Button("Screen Shot") {
                screenshotImage = view.takescreenShot(true)
            }
            .padding()
            .background(Color.gray)
            .cornerRadius(15)
            .foregroundColor(Color.white)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
