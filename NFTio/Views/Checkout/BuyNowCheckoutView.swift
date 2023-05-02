//
//  ByNowCheckoutView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI
import Stripe

struct BuyNowCheckoutView: View {
    @EnvironmentObject var viewModel: CartViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var checkoutViewModel = CheckoutViewModel()
    @State private var promoCode: String = ""
    @State private var selectedPaymentMethod = "Wallet"
    @State private var selectedTab = Tab.wallet
    @State private var isSaving = false
    @State private var showError = false
    @State private var errorMessage = ""
    @State private var paymentMethodParams: STPPaymentMethodParams?
    let paymentGatewayController = PaymentGatewayController()
    
    enum Tab {
        case wallet
        case bankCard
    }
    
    var body: some View {
        let _ = print(userViewModel.user)
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
                    
                    CustomSegmentedControl(selection: $selectedTab) {
                        Text("My Wallet")
                            .segmentedControlItemTag(Tab.wallet)
                        Text("Bank Card")
                            .segmentedControlItemTag(Tab.bankCard)
                    }
                    .padding(.vertical)
                    
                    VStack(alignment: .leading) {
                        switch selectedTab {
                        case .wallet:
                            VStack {
                                if let myWallet = userViewModel.user?.wallet {
                                    Text("Pay by your \(myWallet.rawValue) wallet.")
                                } else {
                                    Text("You do not have a wallet.")
                                }
                            }.transition(.slide)
                        case .bankCard:
                            VStack(alignment: .leading) {
                                STPPaymentCardTextField
                                    .Representable
                                    .init(paymentMethodParams: $paymentMethodParams)
                            }
                        }
                    }
                    .padding(.vertical)
                    Button {
                        isSaving = true
                        errorMessage = ""
                        Task {
                            if selectedTab == .bankCard {
                                await startCheckout()
                                
                                guard let clientSecret = checkoutViewModel.paymentIntentClientSecret else {
                                    showError = true
                                    errorMessage = "Something went wrong!"
                                    return
                                }
                                
                                let paymentIntentParams = STPPaymentIntentParams(clientSecret: clientSecret)
                                paymentIntentParams.paymentMethodParams = paymentMethodParams
                                
                                paymentGatewayController.submitPayment(
                                    intent: paymentIntentParams) { status, _ , _ in
                                        switch status {
                                        case .failed:
                                            showError = true
                                            errorMessage = "Payment failed"
                                        case .canceled:
                                            showError = true
                                            errorMessage = "Payment cancelled"
                                        case .succeeded:
                                            print("payment succeeded")
                                        }
                                    }
                            }
                        }
                        // viewModel.cartItems = []
                        Log.general.debug("Customer checked out 🎉")
                    } label: {
                        ButtonView(buttonText: isSaving ? "Saving" : Constants.Text.Checkout.checkoutButton)
                    }
                    .disabled(isSaving)
                }
            }
                       .alert(isPresented: $showError) {
                           Alert(
                            title: Text("Error!"),
                            message: Text("\(errorMessage)"),
                            dismissButton: .default(Text("OK")))
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
    
    private func startCheckout() async {
        guard let amount = viewModel.totalAmountAfterDiscount else {
            showError = true
            errorMessage = "Amount is not correct"
            return
        }
        
        do {
            try await checkoutViewModel.createPaymentIntent(amount)
            isSaving = false
        } catch let error {
            showError = true
            errorMessage = error.localizedDescription
            isSaving = false
        }
    }
}

struct ByNowCheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        BuyNowCheckoutView()
            .environmentObject(CartViewModel())
            .environmentObject(UserViewModel())
    }
}
