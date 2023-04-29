//
//  CartScreenView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import SwiftUI

struct CartScreenView: View {
    @EnvironmentObject var viewModel: CartViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @State var isLoginScreenOpen = false
    
    var body: some View {
        ZStack(
            alignment: Alignment(
                horizontal: .center,
                vertical: .top
            )
        ) {
            Color(uiColor: .secondarySystemBackground)
                .edgesIgnoringSafeArea(.all)
            NavigationStack {
                VStack(spacing: 0) {
                    if !viewModel.cartItems.isEmpty {
                        CartItemsListView()
                        NavigationLink {
                            BuyNowCheckoutView()
                        } label: {
                            ButtonView(buttonText: Constants.Text.Cart.checkoutButtonLabel)
                        }
                        .padding()
                        .background(
                            Color(uiColor: .secondarySystemBackground)
                            .edgesIgnoringSafeArea(.all)
                        )
                    } else {
                        VStack {
                            Text(Constants.Text.Cart.emptyMessage)
                        }
                        .padding()
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        HStack {
                            Spacer()
                            Text(Constants.Text.Cart.title)
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(Constants.Colors.secondary))
                            Spacer()
                        }
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
                    }
                }
            }
            .fullScreenCover(isPresented: $isLoginScreenOpen) {
                AuthScreen(isPresented: $isLoginScreenOpen)
            }
        }
    }
}

struct CartScreenView_Previews: PreviewProvider {
    
    static var previews: some View {
        CartScreenView()
            .environmentObject(CartViewModel())
            .environmentObject(UserViewModel())
    }
}
