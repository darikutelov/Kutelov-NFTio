//
//  NFTCellView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI
import Kingfisher

struct NFTCellView: View {
    let nft: NFT
    
    var body: some View {
        VStack {
            ZStack {
                KFImage(URL(string: nft.imageUrl))
                    .resizable()
                    .scaledToFit()
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
            .aspectRatio(1.0, contentMode: .fit)
            
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
        ZStack {
            Color(uiColor: .secondarySystemBackground)
            NFTCellView(nft: NFT( id: "3479",
                                  tokenName: "#3479",
                                  description: "The Bored Ape Yacht Club is a collection of 10,000 unique Bored Ape NFTs— unique digital collectibles living on the Ethereum blockchain.",
                                  imageUrl: "https://i.seadn.io/gae/v4CjskuHJt0F_exzLeoIxlZqctqu6TbzFU1kUV9-dH7zHAPUH8K9P_cZyFFmcAlUc1aT4JjkvRVdwQpwjTR34L8XsNxD5lvh922w?auto=format&w=1000",
                                  likes: 29,
                                  creator: "YugaLabs",
                                  category: Category(id: "1", name: .art, imageUrl: "art.jpg"),
                                  collection: collection1,
                                  contractAddress:"0xd4307e0acd12cf46fd6cf93bc264f5d5d1598792",
                                  price: Price(
                                    cryptoCurrency: .ethereum,
                                    priceInCryptoCurrency: 67.45)
                                  ,
                                  quantity: 1,
                                  auctionExpiryDate: "2023-02-28T12:00:00.000Z"
                .getDateFromString(),
                                  bids: [])
                        
            )
        }
    }
}
