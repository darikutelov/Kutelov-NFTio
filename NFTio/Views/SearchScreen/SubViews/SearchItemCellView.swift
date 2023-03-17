//
//  SearchItemCellView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import SwiftUI

struct SearchItemCellView: View {
    let nftItem: NFT
    
    var body: some View {
        HStack(alignment: .top) {
            RoundedImageView(
                imageUrlAsString: nftItem.imageUrl,
                roundedCornerSize: Constants.Spacing.standard
            )
            .scaledToFit()
            .frame(width: Constants.Spacing.superLarge)
            VStack(alignment: .leading, spacing: Constants.Spacing.xsmall) {
                HStack(spacing: Constants.Spacing.small) {
                    CardTitle(text: "\(nftItem.tokenName)")
                }
                HStack() {
                    CardSubheading(text: "\(nftItem.collection.collectionName)")
                }
            }
            .frame(height: Constants.Spacing.superLarge)
            Spacer()
            VStack(alignment: .trailing, spacing: Constants.Spacing.xsmall) {
                Label(text: "Price")
                Text("\(NumberFormatter.ethereumCurrencyFormatter.string(from: nftItem.price.priceInCryptoCurrency as NSNumber) ?? "0")")
                    .foregroundColor(Color(Constants.Colors.primary))
                    .font(.footnote)
                    .fontWeight(.semibold)
            }
            .padding(.trailing, Constants.Spacing.small)
        }
        .padding(Constants.Spacing.small)
        .background(
            RoundedRectangle(cornerRadius: Constants.General.standardCornerRadius)
                .fill(.white)
        )
    }
}

struct SearchItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemCellView(nftItem: NFTDataManager().nftItems.first!)
            //.previewLayout(.sizeThatFits)
    }
        
}
