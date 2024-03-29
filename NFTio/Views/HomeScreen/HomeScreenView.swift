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
    @State var isLoginScreenOpen = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: .secondarySystemBackground)
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {
                        Spacer()
                            .frame(height: Constants.Spacing.xxxlarge)
                        CategoryListView()
                            .padding(.bottom, Constants.Spacing.xxlarge)
                        CollectionListView()
                        
                        NavigationLink {
                            CollectionFullListView()
                        } label: {
                            HStack {
                                Spacer()
                                Text(Constants.Text.Home.seeAllLabel)
                                    .font(.subheadline)
                                    .fontWeight(.medium)
                                    .foregroundColor(Color(Constants.Colors.primary))
                            }
                        }
                        .padding(.bottom, Constants.Spacing.xxlarge)
                        
                        AuctionView()
                        Spacer()
                            .frame(height: Constants.Spacing.superLarge)
                    }
                    .padding(.horizontal)
                }
                .padding(.top, Constants.Spacing.xxlarge)
                .frame(maxWidth: 700)
            }
            .edgesIgnoringSafeArea(.all)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    ShopName()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if userViewModel.user != nil {
                            userViewModel.logoutUser()
                        } else {
                            isLoginScreenOpen = true
                        }
                    } label: {
                        Image(
                            systemName: userViewModel.user != nil ?
                                Constants.Text.IconNames.togglePower :
                                Constants.Text.IconNames.person
                        )
                        .foregroundColor(Color(Constants.Colors.primaryText))
                    }
                    .accessibilityIdentifier("Person")
                }
            }
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
