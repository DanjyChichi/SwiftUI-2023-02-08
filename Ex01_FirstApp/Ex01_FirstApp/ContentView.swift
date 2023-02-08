//
//  ContentView.swift
//  Ex01_FirstApp
//
//  Created by 박상우 on 2022/12/31.
//

// SwiftUI 지원 라이브러리를 추가한다.
import SwiftUI


// View 프로토콜 : 화면에 보이는 모든 요소에 대한 규약(변수, 가상함수)
struct ContentView: View {
    // some 예약어 : View 프로토콜을 준수하는 모든 뷰에 대한 불투명(관용적인) 타입 허용
    var body: some View {
        Text("I love Hahyun")
    }
}

// 미리보기 화면에 대한 정의
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
