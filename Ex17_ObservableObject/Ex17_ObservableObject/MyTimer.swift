//
//  File.swift
//  Ex17_ObservableObject
//
//  Created by 박상우 on 2023/01/14.
//

import Foundation

class MyTimer : ObservableObject {
    @Published var count : Int = 0
    init() {
        // scheduledTimer : 주기적인 코드실행을 한다.
        // timeInterval : 시간 주기
        // repeats : 반복 여부
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {timer in self.count += 1})
    }
}

class MyTimer2 : ObservableObject {
    @Published var count : Int = 0
    init() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){
            timer in self.count += 1
        }
    }
}
