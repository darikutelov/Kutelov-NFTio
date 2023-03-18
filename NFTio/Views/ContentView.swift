//
//  ContentView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.02.23.
//

import SwiftUI

struct ContentView: View {
    @State private var user = User()
    @State var showSplash = true
    @AppStorage("hasSeenWelcomeScreen") private var hasSeenWelcomeScreen = false
    @ObservedObject var nftViewModel = NFTViewModel()
    @ObservedObject var cartViewModel = CartViewModel()
    
    var body: some View {
        ZStack {
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
            LaunchScreen()
              .opacity(showSplash ? 1 : 0)
              .onAppear {
                  DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                  withAnimation() {
                    self.showSplash = false
                  }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(nftViewModel: NFTViewModel())
    }
}
