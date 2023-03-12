//
//  NFTListingView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI
import Kingfisher

struct NFTListView: View {
    @ObservedObject var viewModel: HomeViewViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(viewModel.nftItems, content: \.view)
        }
    }
}

extension NFT {
    var view: some View {
        VStack {
            ZStack {
                RoundedImageView(imageUrlAsString: imageUrl)
                    .scaledToFit()
                    .padding(8.0)
                VStack {
                    Spacer()
                    PriceView(price: price.priceInCryptoCurrency)
                }
                .padding([.bottom], Constants.Spacing.medium)
                VStack {
                    if likes > 0 {
                        LikesView(numberOfLikes: likes)
                            .padding([.trailing, .top], Constants.Spacing.medium)
                    }
                    Spacer()
                }
            }
            
            NameView(name: tokenName)
                .padding(EdgeInsets(
                    top: Constants.Spacing.small,
                    leading: Constants.Spacing.standard,
                    bottom: 0.0,
                    trailing: Constants.Spacing.standard))
            
            CreatorNameView(creator: creator)
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


struct NFTListingView_Previews: PreviewProvider {
    static var previews: some View {
        NFTListView(viewModel: HomeViewViewModel())
    }
}
