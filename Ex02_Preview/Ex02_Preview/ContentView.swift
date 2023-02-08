//
//  ContentView.swift
//  Ex02_Preview
//
//  Created by 박상우 on 2022/12/31.
//

import SwiftUI

struct ContentView: View {
    // Environment 속성 래퍼 : 환경설정을 가져오는 어노테이션
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Text("Hello SwiftUI")
            .padding(.all, 30.0)
            .background(
                colorScheme == .light ? Color.black : Color.white )
            .foregroundColor(colorScheme == .light ? Color.white : Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // 기본모드 뷰
            ContentView().environment(\.colorScheme, .light)
            // 다크모드 뷰
            ContentView().environment(\.colorScheme, .dark)
            ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 14"))
                .previewDisplayName("iPhone14")
            ContentView().previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
                .previewDisplayName("iPhone14 Pro")
        }
    }
}



