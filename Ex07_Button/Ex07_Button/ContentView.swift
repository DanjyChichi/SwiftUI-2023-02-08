//
//  ContentView.swift
//  Ex07_Button
//
//  Created by 박상우 on 2023/01/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // action : 클릭시 수행할 코드 : 클로저
            // label : 버튼 Label 뷰
            Button(action: {
                print("버튼 클릭됨.")
            }, label: {
                Text("버튼")
                    .padding()
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .font(.title)
            })
            Divider()
            // 후행 클로저 : 제일 마지막 매개변수가 클로저일 때, 소괄호를 미리 닫고, 클로저 매개변수 + in 으로 연결한다.
            Button(action: {
                print("버튼2 클릭됨.❤️")
            }){
                Text("버튼2")
                    .foregroundColor(.blue)
                    .font(.title)
                    .padding()
                    .border(Color.yellow, width: 3)
            }
            .padding()
            Divider()
            Button(action: {
                print("play버튼 클릭")
            }){
                Image(systemName: "play.circle")
                    .font(.title)
                Text("Play")
                    .fontWeight(.semibold)
                    .font(.title)
            }
            .padding()
            .foregroundColor(.white)
            //              .background(Color.red)
            .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .leading, endPoint: .trailing))
            .cornerRadius(40)
            Button("버튼3", action: {
                print("버튼3 클릭됨.")
            })
            
            Button(action: {
                print("버튼4 클릭됨.")
            }) { () /* -> _ */ in
                Text("버튼4")
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



