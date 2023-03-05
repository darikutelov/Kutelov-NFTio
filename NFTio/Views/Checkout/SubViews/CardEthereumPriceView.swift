//
//  CardEthereumPriceView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct CardEthereumPriceView: View {
    var ethereumPrice: Decimal
    
    var body: some View {
        HStack {
            Image("ethereumIconBlack")
                .resizable()
                .scaledToFit()
                .frame(width: Constants.Spacing.standard,
                       height: Constants.Spacing.standard
                )
            CardTitle(text: "\(ethereumPrice.rounded(3, .bankers))" as String)
        }
    }
}

struct CardEthereumPriceView_Previews: PreviewProvider {
    static var previews: some View {
        CardEthereumPriceView(ethereumPrice: 145.555)
    }
}
