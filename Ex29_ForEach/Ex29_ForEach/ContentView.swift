//
//  ContentView.swift
//  Ex29_ForEach
//
//  Created by 박상우 on 2023/01/28.
//

import SwiftUI

// 구조체 / 클래스에서 객체생성시 내부변수를 초기화할 때
// 1. init() 함수 : 객체생성시 자동호출
// 2. 생성자 함수 : 객체생성시 매개변수로 값을 주입한다. (가장 많이 쓰임)
// 3. Setter 함수 : 객체생성 후 따로 호출

struct Fruit : Hashable {
    var name : String
}
// Identifiable : 자신이 가진 Id=D를 사용한다. \.id 대체용도
struct Fruit2 : Identifiable {
    // UUID : 거의 유일한 아이디 값을 32자 16진수 문자열로 만들어줌.
    let id = UUID()
    var name : String
}

struct ContentView: View {
    let myCloser = { (num:Int) in
        Text("Num: \(num)")
    }
    let array: [Int] = [1,2,3,4,5,6,7,8,9]
    var fruits : [String] = ["🍎", "🥝", "🍐", "🍊", "🍏"]
    var fruits2 : [Fruit] = [ Fruit(name: "🍎"),
                              Fruit(name: "🥝"),
                              Fruit(name: "🍐"),
                              Fruit(name: "🍊"),
                              Fruit(name: "🍏")
    ]
    var fruits3 : [Fruit2] = [ Fruit2(name: "🍎"),
                               Fruit2(name: "🥝"),
                               Fruit2(name: "🍐"),
                               Fruit2(name: "🍊"),
                               Fruit2(name: "🍏")
    ]
    var body: some View {
        ScrollView{
            VStack {
                //            // ForEach에서는 Close Range는 안됨. ex) 1...10
                //            // Open Range만 가능함.
                //            // 직접 클로저를 매개변수로 넣음
                //            ForEach(1..<10, content: { (num:Int) in
                //                Text("Num: \(num)")
                //            })
                //            Divider()
                //            // 클로저 변수를 대입
                //            ForEach(1..<10, content: myCloser)
                //            Divider()
                //            // 후행 클로저
                //            ForEach(1..<10) { (num:Int) in
                //                Text("Num: \(num)")
                //            }
                //            Divider()
                //            // 배열을 이용한 여러 뷰 생성
                //            // 요소간 구별을 위한 인덱스(ID)가 필요하다.
                //            // \.self : 배열의 자체 데이터를 인덱스로 사용하겠다.
                //            ForEach(array, id: \.self) { num in
                //                Text("Num: \(num)")
                //                }
                //            Divider()
                //            ForEach(fruits, id:\.self) { fruit in
                //                Text("과일: \(fruit)")
                //            }
                //            Divider()
                //            // Hashable이 필요하다는 에러 발생!
                //            // 해쉬(테이블) : 중복되지 않는 ID로 인덱스를 구성한 것
                //            ForEach(fruits2, id:\.self) { fruit in
                //                Text("과일 : \(fruit.name)")
                //            }
                //            Divider()
                // \.id : 자신이 가지고 있는 ID값을 사용하겠다.
                ForEach(fruits3, id: \.id) { fruit in
                    Text("과일 : \(fruit.name)")
                }
                Divider()
                // id 매개변수 생략
                ForEach(fruits3) { fruit in
                    Text("과일 : \(fruit.name)")
                } // VStack
            } // ScrollView
        } // some View
    } // ContentView
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
