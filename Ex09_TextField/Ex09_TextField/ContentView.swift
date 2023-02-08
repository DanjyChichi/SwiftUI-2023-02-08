//
//  ContentView.swift
//  Ex09_TextField
//
//  Created by 박상우 on 2023/01/07.
//

import SwiftUI

struct ContentView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        VStack {
            VStack{
                TextField("이메일", text:
                            self.$email)
                .border(Color.gray, width: 2)
                SecureField("비밀번호", text:self.$password)
                    .border(Color.gray, width: 2)
            }
            .frame(width: 300)
            Text("입력된 이메일: \(self.email)")
            Text("입력된 비밀번호: \(self.password)")
            
            // 컨트롤 뷰를 이쁘게 꾸며주는 뷰
            Form {
                VStack {
                    TextField("이메일", text:self.$email)
                    SecureField("비밀번호", text:self.$password)
                }
                HStack {
                    Button(action: {
                        self.hideKeyboard()
                    }){
                        Text("입력완료")
                    }
                }
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}
// 소프트웨어 키보드를 닫는 기능
// UIKit의 기능을 연결한다.
#if canImport(UIKit)
// extension : 기존 구조체나 클래스의 기능을 추가하는 것
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

#endif
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
