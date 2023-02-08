//  Ex22_NavigationView

import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                Text("Main View")
                    .navigationTitle("Title")
                    //inline : 상단중앙 타이틀
                    //large : 상단왼쪽 타이틀
                    //automatic : 이전뷰의 타이틀 속성을 따라감
                    .navigationBarTitleDisplayMode(.large)
            }
            NavigationView {
                NavigationLink(destination: Text("둘째 화면")) {
                    Text("둘째 화면으로 이동")
                }
                .navigationTitle("메인 화면")
                .navigationBarTitleDisplayMode(.inline)
            }
            NavigationView {
                NavigationLink(destination: SecondView()) {
                    Text("둘째 화면으로 이동")
                }
                .navigationTitle("메인 화면")
                .navigationBarTitleDisplayMode(.inline)
            }
            NavigationView {
                NavigationLink(destination: SecondView()) {
                    Text("둘째화면으로 이동~")
                }
                .navigationTitle("메인 화면")
                .navigationBarItems(leading: Button(action: {
                    print("홈버튼 클릭됨.")
                }, label: {
                    Text("Home")
                }),
                trailing: Button(action: {
                    print("편집버튼 클릭됨.")
                }, label: {
                    Text("Edit")
                })
                )
            }
            
        } //vstack
    }//body
}//contentview

struct SecondView: View {
    var body: some View {
        ZStack {
            Color.yellow
            Text("둘째 화면")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
