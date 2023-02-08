//
//  ContentView.swift
//  Ex23_List
//
//  Created by 박상우 on 2023/01/14.
//

import SwiftUI

// Model 구조체
struct CarMaker {
    let name : String
    let imageUrl : String
    let price : Int
}
extension CarMaker {
    // all() 함수의 반환형은 CarMaker 구조체 배열이다.
    static func all() -> [CarMaker] {
        return [
            CarMaker(name: "모델S", imageUrl: "model-s", price:1000),
            CarMaker(name: "모델3", imageUrl: "model-3", price:2000),
            CarMaker(name: "모델X", imageUrl: "model-x", price:3000),
            CarMaker(name: "모델Y", imageUrl: "model-y", price:4000)]
    }
}

struct ContentView: View {
    let carMaker = CarMaker.all()
    
    var body: some View {
        NavigationView {
            // 데이터, 아이디, 셀데이터
            List(self.carMaker, id: \.name) {
                carMaker in
                NavigationLink(destination: CarMakerDetail(carMaker : carMaker)) {
                    CarMakerCell(carMaker : carMaker)
                }
            }
        }
    }
}

struct CarMakerDetail : View {
    @State var isPresent : Bool = false
    let carMaker : CarMaker
    var body: some View {
        VStack{
            Image(carMaker.imageUrl)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .onTapGesture(count: 2){
                    self.isPresent = true
                }
            Text(carMaker.name)
        }
        .alert(isPresented: self.$isPresent) {
            Alert(title: Text("더블 클릭"),
                  message: Text("차 가격은 \(carMaker.price)입니다."),
                  dismissButton: .default(Text("확인")))
        }
    }
}

struct CarMakerCell : View {
    let carMaker : CarMaker
    var body: some View {
        HStack {
            Spacer()
            Image(carMaker.imageUrl)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(16)
                .frame(width: 128, height: 96, alignment: .center)
            Spacer()
            VStack(alignment: .leading, spacing: 5) {
                Text(carMaker.name).font(.largeTitle)
                Text("\(carMaker.price)원")
            }
            Spacer()
        }
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
