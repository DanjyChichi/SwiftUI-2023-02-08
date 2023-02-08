//
//  ContentView.swift
//  Ex19_StateObject
//
//  Created by 박상우 on 2023/01/14.
//

import SwiftUI

/// Struct 사이의 값을 공유할 때
/// @State, @Binding
/// Class와 Struct 사이의 값을 공유할 때
/// @ObservedObject, ObservableObject, @Published
/// 문제점 : 뷰의 라이프사이클에 의존한다. 뷰가 소멸할 때 값도 소멸한다.
/// @StateObject : iOS 14부터 지원
/// 특징 : 뷰의 라이프사이클에 의존하지 않음. 뷰가 소멸할 때 값을 유지할 수 있다.

class Counter : ObservableObject {
    @Published var count : Int = 0
    init(){}
    func add() {
        count += 1
    }
}

struct CounterView : View {
    // 뷰가 새로 생성되면, 가지고 있는 값이 초기화 된다.
    // @ObservedObject var counter : Counter
    @StateObject var counter : Counter
    // 뷰가 새로 생성되어도 기존에 있던 값을 유지한다.
    var body : some View {
        HStack {
            Text("counter: \(counter.count)")
            Button(action: {
                self.counter.add()
            }){
                Text("Add")
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
    }
}

struct ContentView: View {
    @State private var isChanged : Bool = false
    var body: some View {
        VStack {
            CounterView(counter: Counter())
                .background( isChanged ? Color.red : Color.green)
            Button {
                self.isChanged.toggle()
            } label: {
                Text("Changed")
            }
        }
        .font(.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
