//
//  DiscountAndDiscountAmountView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct DiscountAndDiscountAmountView: View {
    var discountType: DiscountType
    var discount: Discount?
    var discountMessage: String = ""
    var totalAmount: Decimal
    
    init(discountType: DiscountType, discount: Discount? = nil, totalAmount: Decimal) {
        self.discountType = discountType
        self.totalAmount = totalAmount
        
        switch discountType {
        case .seasonalDeals(let seasonName):
            self.discount = discount as! SeasonalDiscount
            discountMessage = "\(seasonName) discount"
        case .promoCode(let code):
            self.discount = discount as! PromoCode
            discountMessage = "Promo Code: \(code) applied"
        }
    }
    
    var discountAmount: Decimal {
        return discount?.calculateDiscount(totalAmount: totalAmount) ?? 0.0
    }
    
    var body: some View {
        HStack {
            Text("\(discountMessage)")
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(Color(Constants.Colors.primary))
            Spacer()
            Text("-\((discount?.dicountPercentage ?? 0.0) * Decimal(100))%" as String)
                .font(.subheadline)
                .fontWeight(.regular)
                .foregroundColor(Color(Constants.Colors.primaryText))
        }
        HStack {
            TotalAmountLabelView(text: Constants.Text.Checkout.amountToPay)
            Spacer()
            CardTitle(text: "\(NumberFormatter.ethereumCurrencyFormatter.string(from: discountAmount as NSNumber) ?? "0")")
        }
    }
}

struct DiscountAndDiscountAmountView_Previews: PreviewProvider {
    static var previews: some View {
        DiscountAndDiscountAmountView(
            discountType: .promoCode("AAAAA"),
            totalAmount: 123123
        )
    }
}
