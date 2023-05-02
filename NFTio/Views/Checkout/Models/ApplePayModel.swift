//
//  ApplePayModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 2.05.23.
//

import Foundation
import Stripe
import PassKit

class ApplePayModel : NSObject, ObservableObject, STPApplePayContextDelegate {
    @Published var paymentStatus: STPPaymentStatus?
    @Published var lastPaymentError: Error?
    var clientSecret: String?

    func pay(clientSecret: String?) {
        self.clientSecret = clientSecret
  
        let paymentRequest = StripeAPI.paymentRequest(withMerchantIdentifier: "kutelov.com.nftio.accept-apple-payment", country: "US", currency: "USD")

        paymentRequest.requiredShippingContactFields = []
        paymentRequest.requiredBillingContactFields = []

        paymentRequest.paymentSummaryItems = [
            PKPaymentSummaryItem(label: "#3535", amount: NSDecimalNumber(string: "59.99")),
            PKPaymentSummaryItem(label: "NFTio", amount: NSDecimalNumber(string: "59.99"))
        ]

        let applePayContext = STPApplePayContext(paymentRequest: paymentRequest, delegate: self)
        applePayContext?.presentApplePay()
    }


    func applePayContext(_ context: STPApplePayContext, didCreatePaymentMethod paymentMethod: STPPaymentMethod, paymentInformation: PKPayment, completion: @escaping STPIntentClientSecretCompletionBlock) {

        if (self.clientSecret != nil) {
            completion(clientSecret, nil)
        } else {
            completion(nil, NSError())
        }
    }

    func applePayContext(_ context: STPApplePayContext, didCompleteWith status: STPPaymentStatus, error: Error?) {
        self.paymentStatus = status
        self.lastPaymentError = error
    }
}
