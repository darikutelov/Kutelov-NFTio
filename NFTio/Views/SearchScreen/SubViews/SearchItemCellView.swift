//
//  SearchItemCellView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import SwiftUI

struct SearchItemCellView: View {
    @Binding var nftItem: NFT
    
    var body: some View {
        HStack(alignment: .top) {
            RoundedImageView(
                imageUrlAsString: Constants.Api.Images.nftItemsBaseUrl + nftItem.imageUrl,
                roundedCornerSize: Constants.Spacing.standard
            )
            .scaledToFit()
            .frame(
                width: Constants.Spacing.superLarge,
                height: Constants.Spacing.superLarge
            )
            VStack(alignment: .leading, spacing: Constants.Spacing.xsmall) {
                HStack(spacing: Constants.Spacing.small) {
                    CardTitle(text: "\(nftItem.tokenName)")
                }
                HStack {
                    CardSubheading(text: "\(nftItem.nftCollection.name)")
                }
            }
            .frame(height: Constants.Spacing.superLarge)
            Spacer()
            VStack(alignment: .trailing,
                   spacing: Constants.Spacing.xsmall) {
                Label(text: Constants.Text.SearchScreen.priceLabel)
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
                .fill(Color(Constants.Colors.cardBackground))
        )
    }
}

struct SearchItemCellView_Previews: PreviewProvider {
    static var previews: some View {
        SearchItemCellView(nftItem: .constant(NFTDataManager().nftItems.first!))
    }
        
}
