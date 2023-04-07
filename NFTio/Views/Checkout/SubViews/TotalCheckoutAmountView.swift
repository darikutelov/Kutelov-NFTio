//
//  TotalCheckoutAmountView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct TotalCheckoutAmountView: View {
    var seasonalDiscount: SeasonalDiscount?
    var promoCode: PromoCode?
    var totalAmount: Decimal
    
    var body: some View {
        VStack(spacing: Constants.Spacing.small) {
            HStack {
                TotalAmountLabelView(text: Constants.Text.Checkout.totalAmount)
                Spacer()
                CardTitle(text: "\(NumberFormatter.ethereumCurrencyFormatter.string(from: totalAmount as NSNumber) ?? "0")")
            }
            
            if let seasonalDiscount =  seasonalDiscount,
               case let .seasonalDeals(seasonName) = seasonalDiscount.discountType {
                DiscountAndDiscountAmountView(
                    discountType: .seasonalDeals(seasonName),
                    discount: seasonalDiscount,
                    totalAmount: totalAmount
                )
            }
                 
            if let promoCode = promoCode,
               case let .promoCode(code) = promoCode.discountType {
                DiscountAndDiscountAmountView(
                    discountType: .promoCode(code),
                    discount: promoCode,
                    totalAmount: totalAmount
                )
            }
        }.padding(.vertical, Constants.Spacing.xlarge)
    }
}

struct TotalCheckoutAmountView_Previews: PreviewProvider {
    static var previews: some View {
        TotalCheckoutAmountView(seasonalDiscount: nil, totalAmount: 111000)
    }
}
