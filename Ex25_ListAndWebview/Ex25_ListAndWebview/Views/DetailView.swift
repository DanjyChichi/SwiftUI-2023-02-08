//
//  DetailView.swift
//  Ex25_ListAndWebview
//
//  Created by 박상우 on 2023/01/14.
//

import SwiftUI

struct DetailView: View {
    let url : String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "http://www.google.com")
    }
}
