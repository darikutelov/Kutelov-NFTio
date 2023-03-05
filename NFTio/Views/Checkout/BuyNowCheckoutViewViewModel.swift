//
//  ByNowCheckoutViewViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import Foundation

final class BuyNowCheckoutViewViewModel: ObservableObject {
    var checkoutItems = [ShoppingCartDataManager.ShoppingCartItem](ShoppingCartDataManager().shoppingCartItems)
    
    let seasonalDiscount: SeasonalDiscount? = SeasonalDiscount(
        seasonName: "Eastern",
        discountPercentage: 0.05
    )
    
    var totalAmount: Decimal {
        checkoutItems.reduce(0.0) { prev, currentItem in
            prev + currentItem.nftItem.price.priceInCryptoCurrency * Decimal(currentItem.quantity)
        }
    }
    
    var totalAmountAfterDiscount: Decimal? {
        guard let seasonalDiscount = seasonalDiscount else { return nil }
        
        return seasonalDiscount.calculateDiscount(totalAmount: totalAmount)
    }
}
