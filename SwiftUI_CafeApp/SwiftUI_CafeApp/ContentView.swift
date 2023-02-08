//
//  ContentView.swift
//  SwiftUI_CafeApp
//
//  Created by 박상우 on 2023/01/28.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.init(red:1.0, green: 1.0, blue: 0.356)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("TAKE IT EASY").font(Font.custom("Copperplate", size: 20))
                        .foregroundColor(Color(red: 0.125, green: 0.176, blue: 1.0))
                    Text("Kim's Coffee").font(Font.custom("Arial Rounded MT Bold", size: 50))
                        .foregroundColor(Color(red: 0.125, green: 0.176, blue: 1.0))
                        .padding(.bottom, 20.0)
                    VStack(spacing: 10) {
                        Button {
                            print("button1 tapped")
                        } label: {
                            NavigationLink {
                                Menu1View()
                            } label: {
                                Text("커피")
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: 150.0, height: 30.0, alignment: .center)
                                    .background(.white)
                            }
                        }
                        Button {
                            print("button2 tapped")
                        } label: {
                            NavigationLink {
                                Menu2View()
                            } label: {
                                Text("음료")
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: 150.0, height: 30.0, alignment: .center)
                                    .background(.white)
                            }
                        }
                        Button {
                            print("button3 tapped")
                        } label: {
                            NavigationLink {
                                Menu3View()
                            } label: {
                                Text("디저트")
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: 150.0, height: 30.0, alignment: .center)
                                    .background(.white)
                            }
                        }
                        Button {
                            print("button4 tapped")
                        } label: {
                            NavigationLink {
                                Menu4View()
                            } label: {
                                Text("스페셜")
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: 150.0, height: 30.0, alignment: .center)
                                    .background(.white)
                            }
                        }
                        Button {
                            print("button5 tapped")
                        } label: {
                            NavigationLink {
                                Menu5View()
                            } label: {
                                Text("매장 찾기")
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: 150.0, height: 30.0, alignment: .center)
                                    .background(.white)
                            }
                        }
                    }
                } // VStack
            } // ZStack
        } // NavigationView
    } // some View
} // View



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
