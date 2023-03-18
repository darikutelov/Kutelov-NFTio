//
//  TabNavigationView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import SwiftUI

struct TabNavigationView: View {
    @AppStorage("HomeScreenCurrentTab") var selectedTab = 0
    
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
                .badge(3)
            ProfileScreenView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(4)
        }
        .onAppear {
            selectedTab = 1
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
    }
}
