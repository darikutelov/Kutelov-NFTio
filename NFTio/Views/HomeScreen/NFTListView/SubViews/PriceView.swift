//
//  PriceView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

struct PriceView: View {
    var price: Decimal
    
    var body: some View {
        HStack {
            Text("\(price.rounded(3, .bankers)) \(CryptoCurrency.ethereum.rawValue)" as String)
                .font(.footnote)
                .foregroundColor(.white)
        }
        .padding(Constants.Spacing.small)
        .background(
            RoundedRectangle(cornerRadius: Constants.General.smallCornerRadius)
                .fill(Color("Black"))
                .opacity(0.5)
        )
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView(price: 45.65)
    }
}
