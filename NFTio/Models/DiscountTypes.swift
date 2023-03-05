//
//  DiscountTypes.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import Foundation

enum DiscountType {
    case seasonalDeals(String)
    case promoCode(String)
}


protocol Discount {
    var discountType: DiscountType { get }
    var dicountPercentage: Decimal? { get }
}

extension Discount {
    func calculateDiscount(totalAmount: Decimal) -> Decimal {
        return totalAmount * ( 1 - (dicountPercentage ?? 0.0))
    }
}

struct SeasonalDiscount: Discount {
    var discountType: DiscountType
    var dicountPercentage: Decimal?
    
    init(seasonName: String, discountPercentage: Decimal) {
        self.discountType = .seasonalDeals(seasonName)
        self.dicountPercentage = discountPercentage
    }
}

class PromoCode: Discount {
    var discountType: DiscountType
    var dicountPercentage: Decimal?
    var error: String?
    
    init(promoCode: String) {
        self.discountType = .promoCode(promoCode)
        self.dicountPercentage = nil
        self.fetchDiscountPercentage(promoCode)
    }
    
    func fetchDiscountPercentage(_ promoCode: String) {
        // checks local or remote DB
        //TODO: - Implement network request
        let fetchResult: Decimal? = 0.1
        
        if let discountPercentage = fetchResult {
            self.dicountPercentage = discountPercentage
        } else {
            self.error = "Not valid code or Network Error!"
        }
    }
}



//enum DiscountType {
//    case firstTimeShopper
//    case abandonedCart
//    case influencers
//    case referal
//    case seasonalDeals(String)
//
//    var discountRate: Decimal {
//        switch self {
//        case .firstTimeShopper:
//            return Constants.Discounts.firstTimeShopper
//        case .abandonedCart:
//            return Constants.Discounts.abandonedCart
//        case .influencers:
//            return Constants.Discounts.influencers
//        case .referal:
//            return Constants.Discounts.referal
//        case .seasonalDeals:
//            return Constants.Discounts.seasonalDeals
//        }
//    }
//
//    var dicountName: String {
//        switch self {
//        case .firstTimeShopper:
//            return "Welcome Discount"
//        case .abandonedCart:
//            return "Special Discount"
//        case .influencers:
//            return "VIP Discount"
//        case .referal:
//            return "Bring a Friend Discount"
//        case .seasonalDeals(let seasonName):
//            return "\(seasonName) discount"
//        }
//    }
//}


