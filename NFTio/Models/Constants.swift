//
//  Constants.swift
//  NFTio
//
//  Created by Dariy Kutelov on 18.02.23.
//

import Foundation
import SwiftUI

enum Constants {
    enum General {
        public static let strokeWidth = CGFloat(2.0)
        public static let roundedViewLength = CGFloat(36.0)
        public static let roundedViewHeight = CGFloat(36.0)
        public static let roundedRectCornerRadius = CGFloat(28.0)
        public static let appIconSize = CGFloat(150.0)
        public static let roundedRectViewWidth = CGFloat(270.0)
        public static let standardCornerRadius = CGFloat(16.0)
        public static let smallCornerRadius = CGFloat(7.0)
        public static let ethereumRateToUsd = Decimal(1568.73)
    }
    enum Spacing {
        public static let xsmall = CGFloat(4.0)
        public static let small = CGFloat(8.0)
        public static let standard = CGFloat(12.0)
        public static let medium = CGFloat(16.0)
        public static let large = CGFloat(20.0)
        public static let xlarge = CGFloat(24.0)
        public static let xxlarge = CGFloat(36.0)
        public static let xxxlarge = CGFloat(64.0)
        public static let superLarge = CGFloat(92.0)
        public static let minCardSize = CGFloat(350.0)
    }
    enum ImageFileNames {
        public static let onboardingBackground = "onboarding-background"
        public static let appIcon = "app-icon"
        public static let authBackground = "auth-background"
    }
    enum Colors {
        public static let primary = "Raspberry"
        public static let primaryText = "TextColor"
        public static let buttonText = "ButtonText"
        public static let buttonBackground = "ButtonBackground"
        public static let secondary = "UltraViolet"
        public static let terciary = "CambridgeBlue"
        public static let charcoal = "Charcoal"
        public static let darkYellow = "DarkYellow"
        public static let white = "White"
        public static let cardBackground = "CardBackground"
        public static let buttonBorderGradientColors = [
            Color.init(hex: "E60404"),
            Color.init(hex: "FB15F2"),
            Color.init(hex: "E1E1E1"),
            Color.init(hex: "17FFD5"),
            Color.init(hex: "73F90A"),
            Color.init(hex: "EFDB22")
        ]
        public static let buttonBackgroundGradientColors = [
            Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.4),
            Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.0)
        ]
    }
    enum Discounts {
        public static let firstTimeShopper: Decimal = 0.03
        public static let abandonedCart: Decimal = 0.05
        public static let influencers: Decimal = 0.075
        public static let referal: Decimal = 0.05
        public static let seasonalDeals: Decimal = 0.10
    }
    enum Api {
        // swiftlint: disable all
        //public static let baseUrl = "https://cryptic-oasis-81288.herokuapp.com/api/v1/"
        public static let baseUnsecureUrl = "http://cryptic-oasis-81288.herokuapp.com/api/v1/"
        public static let baseUrl = "http://localhost:8000/api/v1/"
        enum Images {
            public static let categoryBaseUrl = "https://res.cloudinary.com/dariku/image/upload/h_150,c_scale,q_auto:good/v1647330626/nftio/categories/"
            public static let collectionBaseUrl = "https://res.cloudinary.com/dariku/image/upload/h_150,c_scale,q_auto:good/v1678552863/nftio/collections/"
            public static let nftItemsBaseUrl = "https://res.cloudinary.com/dariku/image/upload/v1679847173/nftio/nftItems/"
        }
        // swiftlint: enable all
        public static let authTokenCookieName = "AuthToken"
        public static let currentUser = "currentUser"
    }
    enum NFTItems {
        public static let numberOfNftItemsOnHomePage = 8
    }
    enum Collections {
        public static let numberOfCollectionsOnHomePage = 5
    }
}
