//
//  ContentView.swift
//  Ex06_Image
//
//  Created by 박상우 on 2023/01/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Image("image2")
//            resizable : 화면해상도에 맞춤
//            .resizable()
//            // aspectRatio : 종횡비를 유지함.
//            // contentMode : fit : 가로 세로 중 더 큰 것에 맞춤.
//            // fill : 가로 세로 중 더 작은 것에 맞춤
//            // 이미지 원본을 뷰의 종횡뷰에 맞춰서 준비하는게 제일 좋다.
//                .aspectRatio(contentMode: .fit)
//            Divider()
            Image("image1")
                .resizable()
                .scaledToFit()
                .frame(width: 250, height:  250)
            Divider()
            // SF Symbols : 애플에서 제공하는 무료 아이콘
            Image(systemName: "play.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(Color.red)
            Divider()
            // 배경 이미지로 사용하기
            Text("카페 이미지").font(.largeTitle)
                .background( Image("image1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200, alignment: .center)
                )
                .frame(width: 200, height: 200, alignment: .center)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(radius: 20, x: 5, y: 5)
                .overlay(Circle().stroke(Color.red, lineWidth:5))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


