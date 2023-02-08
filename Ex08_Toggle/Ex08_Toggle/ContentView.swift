//
//  ContentView.swift
//  Ex08_Toggle
//
//  Created by 박상우 on 2023/01/07.
//

import SwiftUI

// Toggle : on/off 상태를 가지는 뷰

struct ContentView: View {
    // @State : 상태변수를 만들
    // 상태변수 : 뷰와 변수사이의 데이터를 공유한다.
    @State private var isToggleOn = false
    var body: some View {
        VStack {
            //$ : 뷰가 상태변수에 데이터를 쓰거나 읽을 때 사용
            Toggle(isOn: self.$isToggleOn){
                Text("Toggle")
            }
                    .frame(width: 110)
            // 단순히 상태변수를 읽기만 할 때는 $를 안써도 됨.
            if self.isToggleOn == true {
                Text( "Toggle On" )
            } else {
                Text("Toggle off")
            }
            Divider()
            Toggle(isOn: self.$isToggleOn) {
                Text("Toggle")
            }
            .frame(width: 110)
            .padding()
            .toggleStyle(SwitchToggleStyle(tint: Color.orange))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
