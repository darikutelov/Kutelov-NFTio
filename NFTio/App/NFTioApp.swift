//
//  NFTioApp.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.02.23.
//

import SwiftUI
import Firebase

@main
struct NFTioApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
            let _ = Log.general.debug("NFTio started 🚀")
        }
    }
}
