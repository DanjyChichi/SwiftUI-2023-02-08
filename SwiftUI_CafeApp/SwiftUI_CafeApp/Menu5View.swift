//
//  Menu5View.swift
//  SwiftUI_CafeApp


import SwiftUI

struct Menu5View: View {
    var body: some View {
        HStack {
            MyWebView(urlToLoad: "https://paikdabang.com/store/")
        }
        .navigationBarTitle("매장찾기")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Menu5View_Previews: PreviewProvider {
    static var previews: some View {
        Menu5View()
    }
}
