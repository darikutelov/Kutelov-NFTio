//
//  ByNowCheckoutView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct BuyNowCheckoutView: View {
    @EnvironmentObject var viewModel: CartViewModel
    @StateObject var checkoutViewModel = CheckoutViewModel()
    @State var promoCode: String = ""
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color(uiColor: .secondarySystemBackground)
                .edgesIgnoringSafeArea(.all)
            ScrollView(.vertical,
                       showsIndicators: false) {
                VStack {
                    CheckoutItemListView(
                        checkoutItems: viewModel.cartItems
                    )
                    Spacer()
                        .frame(height: Constants.Spacing.xlarge)
                    HStack {
                        TextField(Constants.Text.Checkout.promoCodeInvite, text: $promoCode)
                        Spacer()
                        Button {
                            guard !promoCode.isEmpty else { return }
                            viewModel.applyPromoCode(promoCode)
                        } label: {
                            ButtonView(buttonText: Constants.Text.Checkout.promoCodeAppyButton)
                        }
                    }
                    .padding(.vertical, Constants.Spacing.standard)
                    
                    TotalCheckoutAmountView(
                        seasonalDiscount: viewModel.seasonalDiscount,
                        promoCode: viewModel.promoCodeDiscount,
                        totalAmount: viewModel.totalAmount
                    )
                    
                    // TODO: - Add payment
                    
                    Button {
                        viewModel.cartItems = []
                        Log.general.debug("Customer checked out 🎉")
                    } label: {
                        ButtonView(buttonText: Constants.Text.Checkout.checkoutButton)
                    }
                }
            }
                       .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(
                placement: .navigationBarLeading
            ) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: Constants.Text.IconNames.arrowBack)
                        .foregroundColor(Color(Constants.Colors.primaryText))
                }
            }
            ToolbarItem(placement: .principal) {
                HStack {
                    Spacer()
                    Text(Constants.Text.Checkout.screenTitle)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(Constants.Colors.secondary))
                    Spacer()
                }
                .padding(.leading, -Constants.Spacing.xxlarge)
            }
        }
        .onAppear {
            checkoutViewModel.cartViewModel = viewModel
        }
    }
}

struct ByNowCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        BuyNowCheckoutView()
            .environmentObject(CartViewModel())
    }
}
