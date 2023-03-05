//
//  ByNowCheckoutView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct BuyNowCheckoutView: View {
    @StateObject var viewModel = BuyNowCheckoutViewViewModel()
    
    var body: some View {
        ZStack {
            Color(uiColor: .secondarySystemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Title(text: Constants.Text.Checkout.screenTitle)
                    .padding(.vertical)
                CheckoutItemListView(
                    checkoutItems: viewModel.checkoutItems
                )
                TotalCheckoutAmountView(viewModel: viewModel)
                Button {
                    print("checkout")
                } label: {
                    ButtonView(buttonText: Constants.Text.Checkout.checkoutButton)
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
