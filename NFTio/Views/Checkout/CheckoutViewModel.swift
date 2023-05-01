//
//  CheckoutViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 1.05.23.
//

import Foundation

final class CheckoutViewModel: ObservableObject {
    var cartViewModel: CartViewModel?
    let paymentMetods = ["My Wallet", "Bank Card"]
    var paymentIntentClientSecret: String?
    
    func createPaymentIntent(_ amount: Decimal) async throws {
        let requestUrl = RequestUrl(endpoint: .orders, pathComponents: ["pay", "create-payment-intent"])
        let checkoutIntentResponse = CheckoutIntentResponse(clientSecret: nil, amount: amount * Constants.ExchangeRates.usdToEth)
        
        do {
            let paymentIntent = try await APIService.shared.postData(
                requestUrl,
                bodyData: checkoutIntentResponse
            )
            
            paymentIntentClientSecret = paymentIntent?.clientSecret
        } catch let error {
            throw error
        }
    }
}
