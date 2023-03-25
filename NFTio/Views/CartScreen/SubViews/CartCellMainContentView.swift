//
//  CheckoutCellMainContentView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct CartCellMainContentView: View {
    let tokenName: String
    var ethereumPrice: Decimal
    
    var body: some View {
        HStack(spacing: Constants.Spacing.small) {
            CardTitle(text: tokenName)
            Spacer()
            CardTitle(text: "\(NumberFormatter.ethereumCurrencyFormatter.string(from: ethereumPrice as NSNumber) ?? "0")")
        }
    }
}

struct CheckoutCellMainContentView_Previews: PreviewProvider {
    static var previews: some View {
        CartCellMainContentView(tokenName:"#3479", ethereumPrice: 125.755)
    }
}
