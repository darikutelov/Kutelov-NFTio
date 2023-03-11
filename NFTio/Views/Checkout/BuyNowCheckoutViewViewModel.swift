//
//  ByNowCheckoutViewViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

final class BuyNowCheckoutViewViewModel: ObservableObject {
    var checkoutItems = [ShoppingCartItem](ShoppingCartDataManager().shoppingCartItems)
    
    @Published var seasonalDiscount: SeasonalDiscount? = SeasonalDiscount(
        seasonName: "Eastern",
        discountPercentage: 0.05
    )
    
    @Published var promoCodeDiscount: PromoCode?
    
    var totalAmount: Decimal {
        checkoutItems.reduce(0.0) { prev, currentItem in
            prev + currentItem.nftItem.price.priceInCryptoCurrency * Decimal(currentItem.quantity)
        }
    }
    
    var totalAmountAfterDiscount: Decimal? {
        guard let seasonalDiscount = seasonalDiscount else { return nil }
        
        return seasonalDiscount.calculateDiscount(totalAmount: totalAmount)
    }
    
    func applyPromoCode(_ promoCode: String) {
        let code = PromoCode(promoCode: promoCode)
        
        guard code.error == nil else {
            //TODO: - Show toast with the error
            return
        }
        
        //        guard seasonalDiscount?.dicountPercentage < code.dicountPercentage else {
        //            //TODO: - Show toast 'You can't apply two discounts and current discount is highter then promo code discount'
        //            return
        //        }
        
        seasonalDiscount = nil
        
        promoCodeDiscount = code
    }
}
