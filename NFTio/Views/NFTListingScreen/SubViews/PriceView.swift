//
//  PriceView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

struct PriceView: View {
    var price: Double
    
    var body: some View {
        HStack {
            Image("ethereum")
                .resizable()
                .scaledToFit()
                .frame(width: Constants.Spacing.standard,
                       height: Constants.Spacing.standard
                )
            Text("\(price)")
                .font(.footnote)
                .foregroundColor(.white)
        }
        .padding(Constants.Spacing.small)
        .background(
            RoundedRectangle(cornerRadius: Constants.General.smallCornerRadius)
                .fill(Color("Black"))
                .opacity(0.34)
        )
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView(price: 45.65)
    }
}
