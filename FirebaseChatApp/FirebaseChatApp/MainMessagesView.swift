//
//  MainMessagesView.swift
//  FirebaseChatApp
//
//  Created by tjoeun on 2023/02/11.
//

import SwiftUI

struct MainMessagesView: View {
    @State var shouldShowLogOutOptions = false;
    
    
    var body: some View {
        NavigationView {
            customNavBar
            messagesView
        }
        .navigationBarHidden(true)
    }
    private var customNavBar: some View {
        HStack(spacing: 16) {
            Image(systemName: "person.fill")
                .font(.system(size: 34, weight:  .heavy))
            VStack(alignment: .leading, spacing: 4) {
                Text("USERNAME")
                    .font(.system(size: 24, weight: .bold))
                HStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 14, height: 14)
                    Text("online")
                        .font(.system(size: 12))
                        .foregroundColor(Color(.lightGray))
                }
            }
            Spacer()
            Button() {
                shouldShowLogOutOptions.toggle()
            } label: {
                Image(systemName:"gear")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color(.label))
            }
        }
        .padding()
        .actionSheet(isPresented: $shouldShowLogOutOptions) {
            .init(title: Text("Setting"), message: Text("What do you want to do?"),
                  buttons: [.destructive(Text("Sign Out"),
                                         action:  {print("sign outed.")
            }),
            .cancel()
                  ]
            ) // init
        } // actionSheet
    } // customNavBar
    private var messagesView: some View {
        ScrollView {
            ForEach(0..<10, id: \.self) { num in
                VStack {
                    HStack(spacing: 16) {
                        Image(systemName: "person.fill")
                            .font(.system(size: 32))
                            .padding(8)
                            .overlay(RoundedRectangle(cornerRadius: 44)
                                .stroke(Color(.label), lineWidth: 1)
                            )
                        VStack(alignment: .leading) {
                            Text("Username")
                                .font(.system(size: 16, weight: .bold))
                            Text("Message sent to user")
                                .font(.system(size: 14))
                                .foregroundColor(Color(.lightGray))
                        } // VStack
                        Spacer()
                        
                    } // HStack
                    Divider()
                        .padding(.vertical, 8)
                } // VStack
                .padding(.horizontal)
            } // ForEach
        }.padding(.bottom, 50)
    }
}

struct MainMessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MainMessagesView()
    }
}
