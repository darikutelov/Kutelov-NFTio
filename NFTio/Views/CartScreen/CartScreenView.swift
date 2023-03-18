//
//  CartScreenView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import SwiftUI

struct CartScreenView: View {
    @EnvironmentObject var viewModel: CartViewModel
    
    let columns = [
        GridItem(.flexible(minimum: 300, maximum: 600))
    ]
    
    var body: some View {
        ZStack(
            alignment: Alignment(
                horizontal: .center,
                vertical: .top
            )
        ) {
            Color(uiColor: .secondarySystemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack {
                LazyVGrid(
                    columns: columns,
                    spacing: Constants.Spacing.medium
                ) {
                    ForEach(viewModel.cartItems, id: \.self.nftItem.id) { cartItem in
                        ShoppingCartItemCellView(shoppingCartItem: cartItem)
                    }
                }
                if viewModel.cartItems.count == 0 {
                    Spacer()
                    Text("No NFT items in cart!")
                    Spacer()
                }
            }
            .padding()
        }
    }
}

struct CartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CartScreenView()
            .environmentObject(CartViewModel())
    }
}
