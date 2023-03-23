//
//  CheckoutCellBottomContentUIView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct CartCellBottomContentView: View {
    var ethereumPrice: Decimal
    var quantity: UInt
    
    var body: some View {
        HStack {
            Label(text: "Quantity: \(quantity)")
            Spacer()
            CardSubheading(text:
                            NumberFormatter.currencyFormatter.string(
                                from: ethereumPrice * Constants.General.ethereumRateToUsd as NSDecimalNumber
                            )!
            )
            
        }
    }
}

struct CheckoutCellBottomContentUIView_Previews: PreviewProvider {
    static var previews: some View {
        CartCellBottomContentView(
            ethereumPrice: 125755,
            quantity: 1
        )
    }
}
