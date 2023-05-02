//
//  ApplePayModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 2.05.23.
//

import Foundation
import Stripe
import PassKit

class ApplePayModel: NSObject, ObservableObject, STPApplePayContextDelegate {
    @Published var paymentStatus: STPPaymentStatus?
    @Published var lastPaymentError: Error?
    
    var clientSecret: String?
    var totalAmount: Decimal?
    
    func pay(clientSecret: String?) {
        self.clientSecret = clientSecret
        
        let paymentRequest = StripeAPI
            .paymentRequest(
                withMerchantIdentifier: "kutelov.com.nftio.accept-apple-payment",
                country: "US",
                currency: "USD")

        paymentRequest.requiredShippingContactFields = []
        paymentRequest.requiredBillingContactFields = []
        
        guard let amount = totalAmount else { return }
        
        let usdAmount = amount * Constants.ExchangeRates.usdToEth
        guard let formattedAmount = Formatter.withSeparator.string(from: usdAmount as NSNumber) else {
            return
            
        }

        paymentRequest.paymentSummaryItems = [
            PKPaymentSummaryItem(label: "NFTio", amount: NSDecimalNumber(string: formattedAmount))
        ]

        let applePayContext = STPApplePayContext(paymentRequest: paymentRequest, delegate: self)
        applePayContext?.presentApplePay()
    }

    func applePayContext(_ context: STPApplePayContext,
                         didCreatePaymentMethod paymentMethod: STPPaymentMethod,
                         paymentInformation: PKPayment,
                         completion: @escaping STPIntentClientSecretCompletionBlock) {

        if self.clientSecret != nil {
            completion(clientSecret, nil)
        } else {
            let error = NSError(
                domain: "",
                code: 0,
                userInfo: [NSLocalizedDescriptionKey: "No client secret"])
            completion(nil, error)
        }
    }

    func applePayContext(_ context: STPApplePayContext, didCompleteWith status: STPPaymentStatus, error: Error?) {
        self.paymentStatus = status
        self.lastPaymentError = error
    }
}
