//
//  Constants.swift
//  NFTio
//
//  Created by Dariy Kutelov on 23.02.23.
//

import Foundation

extension Constants {
    enum Text {
        enum Home {
            public static let welcome = String(localized: "Welcome", comment: "Welcome message on home screen")
        }
        enum Onboarding {
            public static let description = String(localized: "Discover, buy, sell, and trade unique digital assets known as non-fungible tokens (NFTs). Browse through various collections of NFTs and view detailed information about each individual NFT.", comment: "App description on onboarding screen")
            public static let getStartedLabel = String(localized: "Get Started", comment: "Text label of get started button")
        }
        enum CustomViews {
            public static let appName = String(localized: "NFTio", comment: "App name")
        }
        
        enum Checkout {
            public static let screenTitle = "buy now"
            public static let checkoutButton = "complete purchase"
            public static let totalAmount = "total amount"
            public static let amountToPay = "amount to pay"
            public static let discount = "discount"
        }
    }
}
