//
//  NFTioApp.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.02.23.
//

import SwiftUI

@main
struct NFTioApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkMonitor)
        }
    }
}
