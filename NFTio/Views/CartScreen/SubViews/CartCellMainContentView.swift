//
//  CheckoutCellMainContentView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct CartCellMainContentView: View {
    var ethereumPrice: Decimal
    
    var body: some View {
        HStack(spacing: Constants.Spacing.small) {
            CardTitle(text: "#3469")
            Spacer()
            CardTitle(text: "\(NumberFormatter.ethereumCurrencyFormatter.string(from: ethereumPrice as NSNumber) ?? "0")")
        }
    }
}

struct CheckoutCellMainContentView_Previews: PreviewProvider {
    static var previews: some View {
        CartCellMainContentView(ethereumPrice: 125.755)
    }
}
