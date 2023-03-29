//
//  NFTioApp.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.02.23.
//

import SwiftUI

@main
struct NFTioApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            let _ = Log.general.debug("NFTio started 🚀")
        }
    }
}
