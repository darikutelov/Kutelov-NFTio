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
    }
    
    enum Spacing {
        public static let small = CGFloat(8.0)
        public static let standard = CGFloat(12.0)
        public static let medium = CGFloat(16.0)
        public static let large = CGFloat(20.0)
        public static let xlarge = CGFloat(24.0)
        public static let xxlarge = CGFloat(36.0)
        public static let xxxlarge = CGFloat(64.0)
    }
    
    enum ImageFileNames {
        public static let onboardingBackground = "onboarding-background"
        public static let appIcon = "app-icon"
    }
    
    enum Colors {
        public static let primary = "Violet"
        public static let primaryText = "TextColor"
        public static let buttonText = "ButtonText"
        public static let buttonBackground = "ButtonBackground"
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
}
