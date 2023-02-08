//
//  ContentView.swift
//  Ex03_Text
//
//  Created by 박상우 on 2022/12/31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Spacer()
            //수정자:
            Text("스위프트\nUI입니다.스위프트 UI입니다.스위프트 UI입니다.")
                .fontWeight(.bold)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
                .padding(.all, 30.0)
                //.font(.system(size: 30))
                .font(Font.custom("DalseoDarling", size: 30))
                .frame(width: 300, height: 300)
                .border(Color.purple, width: 5)
                .background(Color.brown)
                .lineLimit(3)
                .opacity(0.8)
            Spacer()
            Text("쿠키런 폰트입니다.")
                .font(Font.custom("CookieRun Regular", size: 50))
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

