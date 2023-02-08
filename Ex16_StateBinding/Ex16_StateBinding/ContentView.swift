//
//  ContentView.swift
//  Ex16_StateBinding
//
//  Created by 박상우 on 2023/01/14.
//

import SwiftUI

/// @State : 상태변수를 만들 때 사용(같은 Struct에서)
/// 읽기만 할 때 : self.상태변수이름
/// 읽기 / 쓰기 할 때 : self.$상태변수이름
/// @Binding : 서로 다른 Struct에서 상태변수 참조할 때

struct ContentView: View {
    @State var sharedData : String = "init value"
            var body : some View {
                VStack {
                    Text("Shared Data : \(self.sharedData)")
                    // $를 붙이면, Binding된 데이타를 전달할 수 있다.
                    CustomButton1(sharedData: self.$sharedData)
                    CustomButton2(sharedData: self.$sharedData)
        }
    }
}
struct CustomButton1 : View {
        @Binding var sharedData : String
        var body : some View {
            Button(action: {
                self.sharedData = "Button1 Clicked"
            }) {
                Text("Button1")
        }
    }
}

struct CustomButton2 : View {
    @Binding var sharedData : String
    var body : some View {
        Button(action: {
            self.sharedData = "Button2 Clicked"
        }) {
            Text("Button2")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
