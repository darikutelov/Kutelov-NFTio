//
//  TopInfoSectionView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 12.03.23.
//

import SwiftUI

struct TopInfoSectionView: View {
    @EnvironmentObject var viewModel: NFTViewModel
    
    let nft: NFT
    let proxy: GeometryProxy
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                RoundedImageView(imageUrlAsString: Constants.Api.Images.nftItemsBaseUrl +  nft.imageUrl)
                    .scaledToFit()
                Button {
                    viewModel.updateNftItemLikes(nft.id)
                } label: {
                    LikesIconView(
                        isLiked: viewModel.isNftItemLiked(nft.id)
                    )
                    .padding(.top, Constants.Spacing.large)
                    .padding(.trailing, Constants.Spacing.large)
                }
            }
            .frame(height: proxy.size.width)
            .padding()
            
            VStack(spacing: Constants.Spacing.small) {
                Text("\(nft.tokenName)")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(Color(Constants.Colors.primaryText))
                Text("\(nft.nftCollection.name)")
                    .foregroundColor(Color(Constants.Colors.secondary))
                if let description = nft.description {
                    Text("\(description)")
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(Color(Constants.Colors.primaryText)).opacity(0.9)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.vertical)
                }
            }
            .padding()
            Divider()
            HStack {
                Text(Constants.Text.NFTDetail.priceLabel)
                    .font(.subheadline)
                    .foregroundColor(Color(Constants.Colors.primaryText)).opacity(0.7)
                Text("\(nft.price.priceInCryptoCurrency.rounded(3, .bankers)) \(CryptoCurrency.ethereum.rawValue)" as String)
                    .fontWeight(.semibold)
            }
            .padding()
            Divider()
        }
    }
}

struct TopInfoSectionView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            TopInfoSectionView(nft: NFTDataManager().nftItems[0], proxy: geometry)
        }
    }
}
