//
//  WebView.swift
//  Ex25_ListAndWebview
//
//  Created by 박상우 on 2023/01/14.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String?
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(urlString: "http://www.google.com")
    }
}
