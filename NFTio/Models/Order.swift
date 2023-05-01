//
//  Order.swift
//  NFTio
//
//  Created by Dariy Kutelov on 1.05.23.
//

import Foundation

struct OrderItems {
    let itemId: String
    let itemPriceId: Price
    var quantity: Int
}

struct Order {
    let userId: String
    let created: Date
    var items: [OrderItems]
}

struct CheckoutIntentResponse: Codable {
    let clientSecret: String?
    let amount: Decimal?
}
