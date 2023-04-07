//
//  CartScreenView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import SwiftUI

struct CartScreenView: View {
    @EnvironmentObject var viewModel: CartViewModel
    
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
                            ButtonView(buttonText: "Checkout")
                        }
                        .padding()
                        .background(
                            Color(uiColor: .secondarySystemBackground)
                            .edgesIgnoringSafeArea(.all)
                        )
                    } else {
                        VStack {
                            Text("No NFT items in cart!")
                        }
                        .padding()
                    }
                }
                .navigationTitle("Your Cart")
                .navigationBarTitleDisplayMode(.large)
            }

        }
    }
}

struct CartScreenView_Previews: PreviewProvider {
    
    static var previews: some View {
        CartScreenView()
            .environmentObject(CartViewModel())
    }
}
