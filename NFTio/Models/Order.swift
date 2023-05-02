//
//  Order.swift
//  NFTio
//
//  Created by Dariy Kutelov on 1.05.23.
//

import Foundation

struct OrderItems: Codable {
    let itemId: String
    let itemPriceId: Price
    var quantity: Int
}

struct Order: Codable {
    let id: String?
    let userId: String
    let created: Date
    var paymentMethod: String
    var items: [OrderItems]
    var status: String
}

extension Order {
    enum CodingKeys: String, CodingKey {
            case id = "_id"
            case paymentMethod = "payment"
            case userId, created, items, status
        }
}

struct CheckoutIntentResponse: Codable {
    let clientSecret: String?
    let amount: Decimal?
}
