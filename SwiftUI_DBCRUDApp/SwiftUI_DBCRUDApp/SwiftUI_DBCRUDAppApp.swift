
//  SwiftUI_DBCRUDAppApp.swift

import SwiftUI

@main
struct SwiftUI_DBCRUDAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())
        }
    }
}
