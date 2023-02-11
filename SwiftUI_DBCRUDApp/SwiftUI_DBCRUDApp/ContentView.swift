//  ContentView.swift

import SwiftUI

struct HomeView: View {
    //@EnvironmentObject : App전체에서 사용하는 객체
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.items, id: \.id) { item in
                Text("\(item.title)")
            }
        }
        //뷰가 화면에 보일때 한번 실행됨.
        .onAppear(perform: {
            viewModel.fetchPosts()
        })
    }
}

struct ContentView: View {
    var body: some View {
        HomeView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



////  ContentView.swift
//
//import SwiftUI
//
//struct HomeView: View {
//    //@EnvironmentObject : App전체에서 사용하는 객체
//    @EnvironmentObject var viewModel: ViewModel
//    @State var isPresentedNewPost = false
//    @State var title: String = ""
//    @State var post: String = ""
//
//    var body: some View {
//        NavigationView{
//            List {
//                ForEach(viewModel.items, id: \.id) { item in
//                    NavigationLink(
//                        destination: DetailView(item: item),
//                        label: {
//                            VStack(alignment: .leading){
//                                Text(item.title)
//                                Text(item.post)
//                                    .font(.caption)
//                                    .foregroundColor(.gray)
//                            }
//                        }
//                    )//Nav
//                }//ForEach
//                .onDelete(perform: deletePost)
//            }//List
//            .listStyle(InsetListStyle())
//            .navigationBarTitle("Posts")
//            .navigationBarItems(trailing: plusButton)
//        }
////        .sheet(isPresented: $isPresentedNewPost, content: {
////            NewPostView(
////            isPresented : $isPresentedNewPost,
////            title : $title,
////            post : $post)})
//        //뷰가 화면에 보일때 한번 실행됨.
//        .onAppear(perform: {
//            viewModel.fetchPosts()
//        })
//    }//some view
//    private func deletePost(indexSet: IndexSet){
//        let id = indexSet.map{ index in
//            viewModel.items[index].id
//        }
//        DispatchQueue.main.async {
//            let parameters: [String:Any] =
//            ["id" : id[0], "title" : title, "post" : post]
//            self.viewModel.deletePost(parameters: parameters)
//            self.viewModel.fetchPosts()
//        }
//    }
//    var plusButton: some View {
//        Button {
//            isPresentedNewPost.toggle()
//        } label: {
//            Image(systemName: "plus")
//        }
//    }
//
//}//HomeView
//
//struct ContentView: View {
//    var body: some View {
//        HomeView().environmentObject(ViewModel())
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
