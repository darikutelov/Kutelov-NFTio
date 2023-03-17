//
//  NumberFormatter.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import Foundation

extension NumberFormatter {
    static var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "us_US")
        return formatter
    }
    
    static var ethereumCurrencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "bg_BG")
        formatter.currencyDecimalSeparator = "."
        formatter.currencySymbol = "ETH"
        return formatter
    }
}
