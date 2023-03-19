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
                VStack {
                    if viewModel.cartItems.count > 0 {
                       CartItemsListView()
                    }
                    else {
                        VStack {
                            Text("No NFT items in cart!")
                        }
                        .padding()
                    }
                }
                .navigationTitle("Your Cart")
                .navigationBarTitleDisplayMode(.inline)
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
