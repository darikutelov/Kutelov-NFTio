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
    
    // MARK: - Assignment 1
    // THE CART TAB BADGE TO APPEAR YOU WOULD NEED TO
    // ADD ITEMS TO THE CART FROM THE DETAIL VIEW
    // WITH THE "BUY NOW" BUTTON
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeScreenView()
                .tabItem {
                    Image(systemName: "house")
                        .foregroundColor(.white)
                    Text("Home")
                }
                .tag(0)
            SearchScreenView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
                .tag(1)
            AddNFTForSaleView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Add")
                }
                .tag(2)
            CartScreenView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Cart")
                }
                .tag(3)
                .badge(cartViewModel.cartItems.count)
            ProfileScreenView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(4)
        }
        .onAppear {
            selectedTab = 3
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
