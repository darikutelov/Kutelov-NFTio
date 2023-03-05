//
//  PriceView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct CheckoutCellTopContentView: View {
    var collectionName: String
    
    var body: some View {
        HStack(spacing: Constants.Spacing.small) {
            CardSubheading(text: "\(collectionName)")
            Spacer()
            Label(text: "Price")
        }
        
    }
}

struct CheckoutItemPriceView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutCellTopContentView(collectionName: "Apes")
    }
}
