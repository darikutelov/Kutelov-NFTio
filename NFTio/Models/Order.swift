//
//  Order.swift
//  NFTio
//
//  Created by Dariy Kutelov on 1.05.23.
//

import Foundation

struct OrderItem: Codable {
    let itemId: String
    let price: String?
    var quantity: UInt
    
    enum CodingKeys: String, CodingKey {
            case itemId = "_id"
            case price
            case quantity
        }
}

struct Order: Codable {
    let id: String?
    let userId: String
    let created: Date?
    var paymentMethod: String
    var items: [OrderItem]
    var status: String?
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
