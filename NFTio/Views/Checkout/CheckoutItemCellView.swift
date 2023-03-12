//
//  CheckoutItemCellView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI


struct CheckoutItemCellView: View {
    var checkoutItem: ShoppingCartItem
    
    var body: some View {
        HStack {
            RoundedImageView(
                imageUrlAsString: checkoutItem.nftItem.imageUrl,
                roundedCornerSize: .infinity
            )
                .scaledToFit()
                .frame(width: Constants.Spacing.xxxlarge)
            VStack(spacing: Constants.Spacing.small) {
                CheckoutCellTopContentView(
                    collectionName: checkoutItem.nftItem.collection.collectionName
                )
                CheckoutCellMainContentView(
                    ethereumPrice: checkoutItem.nftItem.price.priceInCryptoCurrency)
                CheckoutCellBottomContentView(
                    ethereumPrice: checkoutItem.nftItem.price.priceInCryptoCurrency,
                    quantity: checkoutItem.quantity
                )
            }
            .padding(.leading, Constants.Spacing.small)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: Constants.General.standardCornerRadius)
                .fill(.white)
        )
    }
}

struct CheckoutItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutItemCellView(checkoutItem: ShoppingCartDataManager().shoppingCartItems[0])
    }
}
