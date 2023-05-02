//
//  PaymentGatewayController.swift
//  NFTio
//
//  Created by Dariy Kutelov on 1.05.23.
//

import Foundation
import Stripe
import UIKit

class PaymentGatewayController: UIViewController {
    
    func submitPayment(
        intent: STPPaymentIntentParams,
        completion: @escaping (STPPaymentHandlerActionStatus, STPPaymentIntent?, NSError?) -> Void) {
            
            let paymentHandler = STPPaymentHandler.shared()
            
            paymentHandler.confirmPayment(intent, with: self) { (status, intent, error) in
                completion(status, intent, error)
            }
        }
}

extension PaymentGatewayController: STPAuthenticationContext {
    func authenticationPresentingViewController() -> UIViewController {
       return self
    }
}