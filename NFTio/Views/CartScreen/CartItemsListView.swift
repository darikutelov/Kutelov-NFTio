//
//  CartItemsListView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 19.03.23.
//

import SwiftUI

struct CartItemsListView: View {
    @EnvironmentObject var viewModel: CartViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.cartItems, id: \.self.nftItem.id) { cartItem in
                CartItemCellView(shoppingCartItem: cartItem)
                    .swipeActions(edge: .leading) {
                        Button {
                            viewModel.reduceItemQuantityInCart(shoppingCardItem: cartItem)
                        } label: {
                            Image(systemName: "minus.circle")
                        }
                        .tint(Color(Constants.Colors.terciary))
                        Button {
                            viewModel.addItemToCart(nft: cartItem.nftItem)
                        } label: {
                            Image(systemName: "plus.circle")
                        }
                        .tint(Color(Constants.Colors.darkYellow))
                    }
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            viewModel.removeItemFromCart(shoppingCardItem: cartItem)
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                    .alignmentGuide(.listRowSeparatorLeading) { dimension in
                        dimension[.leading]
                    }
                    .alignmentGuide(.listRowSeparatorTrailing) { dimension in
                        dimension[.trailing]
                    }
            }
            HStack {
                TotalAmountLabelView(text: Constants.Text.Checkout.totalAmount)
                Spacer()
                CardTitle(text: "\(NumberFormatter.ethereumCurrencyFormatter.string(from: viewModel.totalAmount as NSNumber) ?? "0")")
            }
        }
        .listStyle(.insetGrouped)
    }
}

struct CartItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemsListView()
            .environmentObject(CartViewModel())
    }
}
