//
//  CheckoutViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 1.05.23.
//

import Foundation

final class CheckoutViewModel: ObservableObject {
    var cartViewModel: CartViewModel?
    var userViewModel: UserViewModel?

    var paymentIntentClientSecret: String?
    var supportsApplePay: Bool = false
    
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
    
    func saveOrder(userId: String, paymentMethod: String, cartItems: [ShoppingCartItem]) async throws {
        // Convert CartItem to OrderItem
        var orderItems: [OrderItem] = []

        cartItems.forEach { cartItem in
            let orderItem = OrderItem(
                itemId: cartItem.nftItem.id,
                price: cartItem.nftItem.price.id ?? "",
                quantity: cartItem.quantity)
            
            orderItems.append(orderItem)
        }
        
        guard !orderItems.isEmpty else { return }
        
        // Create Order instance
        let order = Order(
            id: nil,
            userId: userId,
            created: nil,
            paymentMethod: paymentMethod,
            items: orderItems,
            status: nil)
        
        // call APIClient to make post request
        let requestUrl = RequestUrl(endpoint: .orders, pathComponents: [userId])
        
        do {
            let _ = try await APIService.shared.postData(
                requestUrl,
                bodyData: order
            )
            
            try await userViewModel?.fetchMyNftItems()
        } catch let error {
            throw error
        }
    }
}
