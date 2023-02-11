//
//  SwiftUI_DBCRUDAppApp.swift
//  SwiftUI_DBCRUDApp
//
//  Created by tjoeun on 2023/02/04.
//

import SwiftUI

@main
struct SwiftUI_DBCRUDAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(ViewModel())
        }
    }
}
