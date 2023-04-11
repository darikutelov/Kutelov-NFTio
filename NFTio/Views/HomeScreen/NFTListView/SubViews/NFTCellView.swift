//
//  NFTCellView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 11.04.23.
//

import SwiftUI

struct NFTCellView: View {
    var nft: NFT
    
    var body: some View {
        VStack {
            ZStack {
                RoundedImageView(
                    imageUrlAsString: Constants.Api.Images.nftItemsBaseUrl + nft.imageUrl
                )
                .padding(8.0)
                VStack {
                    Spacer()
                    PriceView(price: nft.price.priceInCryptoCurrency)
                }
                .padding([.bottom], Constants.Spacing.medium)
                VStack {
                    if nft.likes > 0 {
                        LikesView(numberOfLikes: nft.likes)
                            .padding([.trailing, .top], Constants.Spacing.medium)
                    }
                    Spacer()
                }
            }
            
            NameView(name: nft.tokenName)
                .padding(EdgeInsets(
                    top: Constants.Spacing.small,
                    leading: Constants.Spacing.standard,
                    bottom: 0.0,
                    trailing: Constants.Spacing.standard))
            
            CreatorNameView(creator: nft.creator)
                .padding(EdgeInsets(
                    top: 0.0,
                    leading: Constants.Spacing.standard,
                    bottom: Constants.Spacing.large,
                    trailing: Constants.Spacing.standard)
                )
        }
        .background(
            RoundedRectangle(cornerRadius: Constants.General.standardCornerRadius)
                .fill(.white)
        )
        
    }
}

struct NFTCellView_Previews: PreviewProvider {
    static var previews: some View {
        NFTCellView(nft: NFTViewModel().nftItems.first!)
    }
}
