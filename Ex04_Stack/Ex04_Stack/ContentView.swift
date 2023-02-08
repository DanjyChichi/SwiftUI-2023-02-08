//
//  ContentView.swift
//  Ex04_Stack
//
//  Created by 박상우 on 2022/12/31.
//

import SwiftUI

/// Stack : V, H, Z
/// VStack : 수직 방향 뷰 컨테이너
/// HStack : 수평 방향
/// ZStack : 높낮이 방향(오버레이)


/// 자주 사용하는 뷰는 커스텀 뷰로 선언한다.
struct MyText : View {
    var body: some View {
        Text("Hello SwiftUI")
            .padding()  //  기본값 16픽셀
            .border(.blue, width: 3)
            .background(.yellow)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
//            HStack { // 수평방향 정렬
//                MyText()
//                MyText()
//                MyText()
//            }
//            Divider() //수평선 뷰 살짝 보이는 회색선
            VStack(alignment: .trailing, spacing: 10) {
                MyText()
                MyText()
                MyText()
            }
            .frame(width: 300)
            .padding(0)
            .border(Color.red, width: 3)
            Divider()
            ZStack { // 상하방향 정렬
                //edgesIgnoringSafeArea : 상하좌우 모서리 부분까지 뷰를 표시하겠다.
                Color.yellow.edgesIgnoringSafeArea(.all)
                Color.red
                    .frame(width: 200, height: 200)
                Color.blue
                    .frame(width:100, height: 100)
            }
            .padding(0)
            .border(Color.red, width: 3)
            Divider()
            HStack(alignment: .center, spacing: 10) {
                Text("Hello").font(.caption)
                Text("Hello")
                Text("Hello").font(.title)
                Text("Hello").font(.largeTitle)
            }
            .padding(10)
            .border(Color.red, width:3)
            Divider()
            VStack(alignment: .trailing) {
                Text("Hello World").border(Color.red, width:1)
                Text("Hello").border(Color.red, width:1)
                Text("Hi").border(Color.black, width:1)
            }
            .border(Color.red, width: 1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

