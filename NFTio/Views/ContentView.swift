//
//  ContentView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.02.23.
//

import SwiftUI

struct ContentView: View {
    @State private var user = User()
    @AppStorage("hasSeenWelcomeScreen") private var hasSeenWelcomeScreen = false
    @ObservedObject var nftViewModel = NFTViewModel()
    @ObservedObject var cartViewModel = CartViewModel()
    
    var body: some View {
        if hasSeenWelcomeScreen {
            TabNavigationView()
                .environmentObject(nftViewModel)
                .environmentObject(cartViewModel)
        } else {
            WelcomeScreenView(user: $user)
                .onAppear {
                    hasSeenWelcomeScreen = true
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(nftViewModel: NFTViewModel())
    }
}
