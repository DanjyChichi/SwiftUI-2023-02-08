//
//  MyWebView.swift
//  SwiftUI_CafeApp
//
//  Created by 박상우 on 2023/02/04.
//

import SwiftUI
import WebKit

struct MyWebView: UIViewRepresentable {
    var urlToLoad: String
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.urlToLoad) else {
            //url이 nil이면,
            return WKWebView()
        }
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView;
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // 웹뷰가 업데이트 될 떄 호출되는 함수.
    }
}

struct MyWebView_Previews: PreviewProvider {
    static var previews: some View {
        MyWebView(urlToLoad: "https://paikdabang.com/store/")
    }
}
