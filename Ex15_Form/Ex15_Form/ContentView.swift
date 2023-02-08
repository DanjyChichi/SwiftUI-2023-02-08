//
//  ContentView.swift
//  Ex15_Form
//
//  Created by 박상우 on 2023/01/14.
//

import SwiftUI

struct ContentView: View {
    // Form 뷰 : UI 표준양식을 지원하는 뷰
    //         : 반듯한, 이쁜 UI
    // NavigationView : 화면이동을 해줌.
    @State var username : String = ""
    @State var isPrivate : Bool = true
    @State var previewIndex = 0
    let previewOptions : Array<String> = ["Always", "When Unlocked", "Never"]
    
    var body: some View {
        NavigationView {
            Form {
                // Section : 뷰의 그룹을 의미
                Section(header: Text("Profile")) {
                    TextField("UserName", text: self.$username)
                    Toggle(isOn: self.$isPrivate){
                        Text("Private Account")
                    }
                }
                Section(header: Text("NOTIFICATIONS")){
                    Toggle(isOn:self.$notificationEnabled){
                        Text("Enabled")
                    }
                    Picker(selection: self.$previewIndex, label: Text("Show Preview")){
                        ForEach(0 ..< previewOptions.count){
                            index in
                            Text(self.previewOptions[index])
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
