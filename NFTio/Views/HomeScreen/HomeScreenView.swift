//
//  HomeView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 11.03.23.
//

import SwiftUI

struct HomeScreenView: View {
    @EnvironmentObject var nftViewModel: NFTViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @State var homePageNftItems = [NFT]()
    @State var isLoginScreenOpen = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: .secondarySystemBackground)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        Spacer()
                            .frame(height: Constants.Spacing.superLarge)
                        CategoryListView()
                            .padding(.bottom, Constants.Spacing.xxlarge)
                        CollectionListView()
                            .padding(.bottom, Constants.Spacing.xxlarge)
                        NFTListView(
                            nftItems: $homePageNftItems,
                            sectionName: Constants.Text.Home.nftListLabel
                        )
                    }
                    .padding(.horizontal)
                }
                .padding(.top, Constants.Spacing.xxlarge)
            }
            .edgesIgnoringSafeArea(.all)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    ShopName()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if userViewModel.currentUser != nil {
                            userViewModel.logoutUser()
                        } else {
                            isLoginScreenOpen = true
                        }
                        
                    } label: {
                        Image(
                            systemName: userViewModel.currentUser != nil ? "togglepower" : "person"
                        )
                        .foregroundColor(Color(Constants.Colors.primaryText))
                    }

                }
            }
        }
        .onAppear {
            homePageNftItems = Array(nftViewModel
                .nftItems
                .prefix(Constants.NFTItems.numberOfNftItemsOnHomePage))
        }
        .fullScreenCover(isPresented: $isLoginScreenOpen) {
            AuthScreen(isPresented: $isLoginScreenOpen)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
            .environmentObject(NFTViewModel())
            .environmentObject(UserViewModel())
    }
}
