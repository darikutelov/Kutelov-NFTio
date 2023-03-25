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
    @AppStorage(Constants.Text.LaunchScreen.hasSeenWelcomeScreen) private var hasSeenWelcomeScreen = false
    @ObservedObject var nftViewModel = NFTViewModel()
    @ObservedObject var cartViewModel = CartViewModel()
    
    var body: some View {
        ZStack {
            if hasSeenWelcomeScreen {
                TabNavigationView()
            } else {
                WelcomeScreenView(user: $user)
            }
            
            //TODO: - Switch on back animation
//            LaunchScreen()
//              .opacity(showSplash ? 1 : 0)
//              .onAppear {
//                  DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//                  withAnimation() {
//                    self.showSplash = false
//                  }
//                }
//            }
        }
        .environmentObject(nftViewModel)
        .environmentObject(cartViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(nftViewModel: NFTViewModel())
    }
}
