//
//  ContentView.swift
//  Ex10_Practice01
//
//  Created by 박상우 on 2023/01/07.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea(.all)
            VStack {
                Image("profile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding()
                Text("Park Sang Woo")
                    .foregroundColor(.white)
                    .font(Font.custom("Nautilus Pompilius", size: 40))
                    .fontWeight(.bold)
                    .padding(1)
                Text("iOS Developer")
                    .foregroundColor(.white)
                Divider().padding(10)
                
                InfoView(text: "82 010 5670 5754", imageName: "call")
                
//                Text("+ 44 123 456 789")
//                    .frame(width: 350, height: 50)
//                    .background(.white)
//                    .cornerRadius(50)
//                    .padding()
//                Text("td7080@naver."+"com")
//                    .frame(width: 350, height: 50)
//                    .background(.white)
//                    .cornerRadius(50)
                }
            }
        }
    }

struct InfoView: View {
    let text: String
    let imageName: String
    
    var body: some View{
        RoundedRectangle(cornerRadius:25)
            .fill(Color.white)
            .frame(height: 50)
            .overlay(
                HStack{
                    Image(systemName:self.imageName)
                        .foregroundColor(.green)
                    Text(self.text).foregroundColor(.black)
                }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


