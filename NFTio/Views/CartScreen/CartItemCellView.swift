//
//  CheckoutItemCellView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct CartItemCellView: View {
    var shoppingCartItem: ShoppingCartItem
    
    var body: some View {
        HStack(alignment: .center) {
            RoundedImageView(
                imageUrlAsString: Constants.Api.Images.nftItemsBaseUrl +  shoppingCartItem.nftItem.imageUrl,
                roundedCornerSize: .infinity
            )
                .scaledToFit()
                .frame(height: Constants.Spacing.xxxlarge)
            VStack(spacing: Constants.Spacing.small) {
                CartCellTopContentView(
                    collectionName: shoppingCartItem.nftItem.nftCollection.name
                )
                CartCellMainContentView(
                    tokenName: shoppingCartItem.nftItem.tokenName,
                    ethereumPrice: shoppingCartItem.nftItem.price.priceInCryptoCurrency)
                CartCellBottomContentView(
                    ethereumPrice: shoppingCartItem.nftItem.price.priceInCryptoCurrency,
                    quantity: shoppingCartItem.quantity
                )
            }
            .padding(.leading, Constants.Spacing.small)
        }
        .background(
            RoundedRectangle(cornerRadius: Constants.General.standardCornerRadius)
                .fill(Color(Constants.Colors.cardBackground))
        )
    }
}

struct CheckoutItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        CartItemCellView(shoppingCartItem: ShoppingCartDataManager().shoppingCartItems[0])
    }
}
