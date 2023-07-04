//
//  NFTioApp.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.02.23.
//

import SwiftUI
import Stripe

@main
struct NFTioApp: App {
    @StateObject var networkMonitor = NetworkMonitor()
    
    init() {
        StripeAPI.defaultPublishableKey = "pk_test_MDxNQI9pKFgcODiEl0SWjMUk"
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(networkMonitor)
        }
    }
}
