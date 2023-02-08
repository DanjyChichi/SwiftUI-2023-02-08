//  Ex15_Form

import SwiftUI

struct ContentView: View {
    //Form뷰 : UI 표준양식을 지원하는 뷰
    //      : 반듯한, 이쁜 UI
    //NavigationView : 화면이동을 해줌.
    @State var username: String = ""
    @State var isPrivate: Bool = true
    @State var notificationsEnabled: Bool = false
    @State var previewIndex = 0
    let previewOptions: Array<String> = ["Always", "When Unlocked", "Never"]
    
    var body: some View {
        NavigationView {
            Form {
                //Section : 뷰의 그룹을 의미
                Section(header: Text("PROFILE")){
                    TextField("UserName", text: self.$username)
                    Toggle(isOn: self.$isPrivate) {
                        Text("Private Account")
                    }
                }
                Section(header: Text("NOTIFICATIONS")) {
                    Toggle(isOn: self.$notificationsEnabled) {
                        Text("Enabled")
                    }
                    Picker(selection: self.$previewIndex, label: Text("Show Preview")) {
                        ForEach(0 ..< previewOptions.count){
                            index in
                            Text(self.previewOptions[index])
                        }
                    }
                    
                }
                Section(header: Text("ABOUT")) {
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("2.0.1")
                    }
                }
                Section{
                    Button(action: {
                        print("button clicked")
                    }){
                        Text("Reset All Settings")
                    }
                }
                
            } //navigationView
            .navigationBarTitle("Settings")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
