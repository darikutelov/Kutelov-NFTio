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
        self.fetchDiscountPercentage()
    }
    func fetchDiscountPercentage() {
        if case let .promoCode(code) = discountType {
            print(code)
            // checks local or remote DB
            // (- Implement network request)(todo)
            let fetchResult: Decimal? = 0.15
            if let discountPercentage = fetchResult {
                self.dicountPercentage = discountPercentage
            } else {
                self.error = "Not valid code or Network Error!"
            }
        }
    }
}
