//
//  TabNavigationView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import SwiftUI

struct TabNavigationView: View {
    @AppStorage(Constants.Text.TabView.userdefaultsKey) var selectedTab = 0
    @EnvironmentObject var cartViewModel: CartViewModel
    @AppStorage(Constants.Text.LaunchScreen.hasSeenWelcomeScreen) private var hasSeenWelcomeScreen = false
    
    // MARK: - Assignment 1
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeScreenView()
                .tabItem {
                    Image(systemName: Constants.Text.TabView.homeIcon)
                    Text(Constants.Text.TabView.homeLabel)
                }
                .tag(0)
            SearchScreenView()
                .tabItem {
                    Image(systemName: Constants.Text.TabView.searchIcon)
                    Text(Constants.Text.TabView.searchLabel)
                }
                .tag(1)
            AddNFTForSaleView()
                .tabItem {
                    Image(systemName: Constants.Text.TabView.addNFTIcon)
                    Text(Constants.Text.TabView.addNFTLabel)
                }
                .tag(2)
            CartScreenView()
                .tabItem {
                    Image(systemName: Constants.Text.TabView.cartIcon)
                    Text(Constants.Text.TabView.cartLabel)
                }
                .tag(3)
                .badge(cartViewModel.cartItems.count)
            ProfileScreenView()
                .tabItem {
                    Image(systemName: Constants.Text.TabView.profileIcon)
                    Text(Constants.Text.TabView.profileLabel)
                }
                .tag(4)
        }
        .onAppear {
//            selectedTab = 0
            hasSeenWelcomeScreen = true
            setTabBarUI()
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    private func setTabBarUI() {
        UITabBar.appearance().backgroundColor = UIColor(
            Color(.systemGroupedBackground)
        )
        UITabBarItem.appearance().badgeColor = UIColor(
            Color(Constants.Colors.secondary)
        )
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
            .previewLayout(.sizeThatFits)
            .environmentObject(CartViewModel())
    }
}
