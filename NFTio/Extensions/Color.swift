//
//  Color.swift
//  NFTio
//
//  Created by Dariy Kutelov on 19.02.23.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let aAlpha, aRed, aGreen, aBlue: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (aAlpha, aRed, aGreen, aBlue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (aAlpha, aRed, aGreen, aBlue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (aAlpha, aRed, aGreen, aBlue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (aAlpha, aRed, aGreen, aBlue) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(aRed) / 255,
            green: Double(aGreen) / 255,
            blue: Double(aBlue) / 255,
            opacity: Double(aAlpha) / 255
        )
    }
}

extension ShapeStyle where Self == Color {
    static var random: Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
