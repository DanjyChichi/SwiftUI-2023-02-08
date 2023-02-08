//
//  ContentView.swift
//  Ex14_Scroll
//
//  Created by 박상우 on 2023/01/07.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ScrollView(){
                VStack{
                    ForEach(1..<31) {
                        index in
                        Text("Count\(index)")
                            .font(.largeTitle)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .frame(height: 200)
            .background(.orange)
            Divider()
            ScrollView(.horizontal,
                       showsIndicators: false) {
                HStack {
                    ForEach(1..<31) {
                        index in
                        Text("Count\(index)")
                            .font(.largeTitle)
                    }
                }
            }
            .frame(height: 200)
            .background(.purple)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
