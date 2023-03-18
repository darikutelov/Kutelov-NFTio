//
//  CheckoutItemCellView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI


struct ShoppingCartItemCellView: View {
    var shoppingCartItem: ShoppingCartItem
    
    var body: some View {
        HStack {
            RoundedImageView(
                imageUrlAsString: shoppingCartItem.nftItem.imageUrl,
                roundedCornerSize: .infinity
            )
                .scaledToFit()
                .frame(width: Constants.Spacing.xxxlarge)
            VStack(spacing: Constants.Spacing.small) {
                CheckoutCellTopContentView(
                    collectionName: shoppingCartItem.nftItem.collection.collectionName
                )
                CheckoutCellMainContentView(
                    ethereumPrice: shoppingCartItem.nftItem.price.priceInCryptoCurrency)
                CheckoutCellBottomContentView(
                    ethereumPrice: shoppingCartItem.nftItem.price.priceInCryptoCurrency,
                    quantity: shoppingCartItem.quantity
                )
            }
            .padding(.leading, Constants.Spacing.small)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: Constants.General.standardCornerRadius)
                .fill(Color(Constants.Colors.cardBackground))
        )
    }
}

struct CheckoutItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartItemCellView(shoppingCartItem: ShoppingCartDataManager().shoppingCartItems[0])
    }
}
