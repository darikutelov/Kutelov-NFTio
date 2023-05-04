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
    @ObservedObject var nftViewModel = NFTViewModel()
    @ObservedObject var cartViewModel = CartViewModel()
    @ObservedObject var userViewModel = UserViewModel()
    
    @AppStorage(Constants.Text.LaunchScreen.hasSeenWelcomeScreen) private var hasSeenWelcomeScreen = false
    
    var body: some View {
        //         let _ = Log.general.debug("Current User: \(userViewModel.user != nil ? String(describing: userViewModel.user) : "None")")
        ZStack {
            if hasSeenWelcomeScreen {
                TabNavigationView()
            } else {
                WelcomeScreenView()
            }
            LaunchScreen()
                .opacity(showSplash ? 1 : 0)
                .onAppear {
                    Task {
                        try? await Task.sleep(nanoseconds: 3_000_000_000)
                        withAnimation {
                            self.showSplash = false
                        }
                    }
                }
        }
        .environmentObject(nftViewModel)
        .environmentObject(cartViewModel)
        .environmentObject(userViewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(nftViewModel: NFTViewModel())
    }
}
