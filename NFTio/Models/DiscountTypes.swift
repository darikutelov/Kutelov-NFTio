//
//  DiscountTypes.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import Foundation

enum DiscountType {
    case firstTimeShopper
    case abandonedCart
    case influencers
    case referal
    case seasonalDeals(String)
    
    var discountRate: Decimal {
        switch self {
        case .firstTimeShopper:
            return Constants.Discounts.firstTimeShopper
        case .abandonedCart:
            return Constants.Discounts.abandonedCart
        case .influencers:
            return Constants.Discounts.influencers
        case .referal:
            return Constants.Discounts.referal
        case .seasonalDeals:
            return Constants.Discounts.seasonalDeals
        }
    }
    
    var dicountName: String {
        switch self {
        case .firstTimeShopper:
            return "Welcome Discount"
        case .abandonedCart:
            return "Special Discount"
        case .influencers:
            return "VIP Discount"
        case .referal:
            return "Bring a Friend Discount"
        case .seasonalDeals(let seasonName):
            return "\(seasonName) discount"
        }
    }
}


