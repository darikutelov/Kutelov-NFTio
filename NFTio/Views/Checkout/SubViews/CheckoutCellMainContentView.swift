//
//  CheckoutCellMainContentView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct CheckoutCellMainContentView: View {
    var ethereumPrice: Decimal
    
    var body: some View {
        HStack(spacing: Constants.Spacing.small) {
            CardTitle(text: "#3469")
            Spacer()
            CardEthereumPriceView(ethereumPrice: ethereumPrice)
        }
    }
}

struct CheckoutCellMainContentView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutCellMainContentView(ethereumPrice: 125.755)
    }
}
