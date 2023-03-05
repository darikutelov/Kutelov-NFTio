//
//  TotalCheckoutAmountView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct TotalCheckoutAmountView: View {
    var viewModel: BuyNowCheckoutViewViewModel
    var body: some View {
        VStack(spacing: Constants.Spacing.small){
            HStack {
                TotalAmountLabelView(text: Constants.Text.Checkout.totalAmount)
                Spacer()
                CardEthereumPriceView(ethereumPrice: viewModel.totalAmount)
            }
            if let seasonalDiscount =  viewModel.seasonalDiscount,
               let discountPercentage = seasonalDiscount.dicountPercentage,
               case let .seasonalDeals(seasonName) = seasonalDiscount.discountType {
                HStack {
                    Text("\(seasonName) \(Constants.Text.Checkout.discount)")
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color(Constants.Colors.primary))
                    Spacer()
                    Text("-\(discountPercentage * Decimal(100))%" as String)
                        .font(.subheadline)
                        .fontWeight(.regular)
                        .foregroundColor(Color(Constants.Colors.primaryText))
                }
                HStack {
                    TotalAmountLabelView(text: Constants.Text.Checkout.amountToPay)
                    Spacer()
                    CardEthereumPriceView(ethereumPrice: seasonalDiscount.calculateDiscount(totalAmount: viewModel.totalAmount))
                }
            }
        }.padding(.bottom)
    }
}

struct TotalCheckoutAmountView_Previews: PreviewProvider {
    static var previews: some View {
        TotalCheckoutAmountView(viewModel: BuyNowCheckoutViewViewModel())
    }
}
