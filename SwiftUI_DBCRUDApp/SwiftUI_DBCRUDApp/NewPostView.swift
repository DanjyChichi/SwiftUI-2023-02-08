//  NewPostView.swift

import SwiftUI

struct NewPostView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Binding var isPresented: Bool
    @Binding var title: String
    @Binding var post: String
    @State var isAlert = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    Text("Create new post")
                        .font(Font.system(size: 16, weight: .bold))
                    TextField("Title", text: $title)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(6)
                        .padding(.bottom)
                    TextField("Write something...", text: $post)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(6)
                        .padding(.bottom)
                    Spacer()
                }
                .padding()
                .alert(isPresented: $isAlert, content: {
                    let title = Text("No data")
                    let message = Text("Please fill your title and post!")
                    return Alert(title: title, message: message)
                })
            }//ZStack
            .navigationBarTitle("New Post", displayMode: .inline)
            .navigationBarItems(leading: Button("Cancel"){
                isPresented.toggle() //내화면 닫기
            }, trailing: Button("Post"){
                if title != "" && post != "" {
                    let parameters: [String: Any] = ["title": title, "post": post]
                    viewModel.cratePost(parameters: parameters)
                    viewModel.fetchPosts()
                    
                    isPresented.toggle()
                }else{
                    isAlert.toggle()
                }
            })
        }//NavigationView
    }//body
}//struct

//struct NewPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewPostView()
//    }
//}
