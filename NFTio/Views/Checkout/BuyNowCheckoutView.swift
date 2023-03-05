//
//  ByNowCheckoutView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct BuyNowCheckoutView: View {
    @StateObject var viewModel = BuyNowCheckoutViewViewModel()
    @State var promoCode: String = ""
    
    var body: some View {
        ZStack {
            Color(uiColor: .secondarySystemBackground)
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical,
                       showsIndicators: false) {
                VStack {
                    Title(text: Constants.Text.Checkout.screenTitle)
                        .padding(.vertical)
                    CheckoutItemListView(
                        checkoutItems: viewModel.checkoutItems
                    )
                    Spacer()
                        .frame(height: Constants.Spacing.xlarge)
                    HStack {
                        TextField(Constants.Text.Checkout.promoCodeInvite, text: $promoCode)
                        Spacer()
                        Button {
                            guard promoCode.count > 0 else { return }
                            viewModel.applyPromoCode(promoCode)
                        } label: {
                            ButtonView(buttonText: Constants.Text.Checkout.promoCodeAppyButton)
                        }
                    }.padding(.vertical, Constants.Spacing.standard)
                    TotalCheckoutAmountView(
                        seasonalDiscount: viewModel.seasonalDiscount,
                        promoCode: viewModel.promoCodeDiscount,
                        totalAmount: viewModel.totalAmount
                    )
                    Button {
                        print("checkout")
                    } label: {
                        ButtonView(buttonText: Constants.Text.Checkout.checkoutButton)
                    }
                }
            }
            .padding()
        }
    }
}

struct ByNowCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        BuyNowCheckoutView()
    }
}
