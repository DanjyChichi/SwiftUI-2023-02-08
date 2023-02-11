//
//  DetailView.swift
//  SwiftUI_DBCRUDApp
//
//  Created by 박상우 on 2023/02/04.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.presentationMode) var presentationMode
    let item: PostModel
    @State var title: String = ""
    @State var post: String = ""
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text("Update post ")
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
            .onAppear(perform:  {
                self.title = item.title
                self.post = item.post
            })
        }
        .navigationBarTitle("Edit Post", displayMode: .inline)
        .navigationBarItems(trailing: Button("Save"){
            print("Save")
            if title != "" && post != "" {
                let parameters: [String: Any] = ["id": item.id, "title": title, "post": post]
                viewModel.updatePost(parameters: parameters)
                viewModel.fetchPosts()
                // 뒤로가기
                presentationMode.wrappedValue.dismiss()
            }
        })
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
