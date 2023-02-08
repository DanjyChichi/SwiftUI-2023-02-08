//
//  ContentView.swift
//  Ex17_ObservableObject
//
//  Created by 박상우 on 2023/01/14.
//

import SwiftUI

// @State, @Binding : Struct 간의 데이터 공유
// @ObservedObject : Struct와 Class와의 데이터 공유
// struct : @ObservedObject
// class : ObservableObject, @Published

struct ContentView: View {
    @ObservedObject var myTimer = MyTimer2()
    var body: some View {
        Text("Timer : \(myTimer.count)")
            .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
