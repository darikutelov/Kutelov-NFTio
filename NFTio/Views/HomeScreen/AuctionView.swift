//
//  AuctionView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 3.05.23.
//

import SwiftUI

struct AuctionView: View {
    @EnvironmentObject var nftViewModel: NFTViewModel
    
    var body: some View {
        VStack {
            Section(
                header: SectionHeaderView(
                    sectionName: Constants.Text.Home.featuredAuction
                )
                .padding(.bottom, Constants.Spacing.small)
            ) {
                if let featuredNFT = nftViewModel.featuredNFT,
                   let auctionExpiryDate = nftViewModel.featuredNFT?.auctionExpiryDate,
                   let sortedBids = featuredNFT.bids.sorted(by: {
                       $0.price.priceInCryptoCurrency < $1.price.priceInCryptoCurrency
                   }),
                   let bestBidPrice = sortedBids[0].price.priceInCryptoCurrency {
                    RoundedImageView(imageUrlAsString: Constants.Api.Images.nftItemsBaseUrl + featuredNFT.imageUrl)
                        .scaledToFit()
                    
                    TimerSectionView(auctionExpiryDate: auctionExpiryDate)
                    
                    HStack {
                        HStack {
                            Text(Constants.Text.Home.listedPrice)
                                .font(.subheadline)
                                .foregroundColor(Color(Constants.Colors.primaryText)).opacity(0.7)
                            Text("\(featuredNFT.price.priceInCryptoCurrency.rounded(2, .bankers)) \(CryptoCurrency.ethereum.rawValue)" as String)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(Constants.Colors.secondary))
                        }
                        .padding()
                        Spacer()
                        HStack {
                            Text(Constants.Text.Home.bestBidPrice)
                                .font(.subheadline)
                                .foregroundColor(Color(Constants.Colors.primaryText)).opacity(0.7)
                            Text("\(bestBidPrice.rounded(2, .bankers)) \(CryptoCurrency.ethereum.rawValue)" as String)
                                .fontWeight(.semibold)
                                .foregroundColor(Color(Constants.Colors.primary))
                        }
                        .padding()
                    }
                    
                    Divider().padding(.horizontal)
                    NavigationLink {
                        NFTDetailView(nft: featuredNFT)
                    } label: {
                        ButtonIconView(
                            buttonText: Constants.Text.NFTDetail.makeOfferButton,
                            buttonTextColor: Constants.Colors.white,
                            buttonBackgroundColor: Constants.Colors.secondary,
                            iconName: Constants.Text.NFTDetail.offerButtonIcon
                        )
                        .padding()
                    }
                }
            }
        }
    }
}

struct AuctionView_Previews: PreviewProvider {
    static var previews: some View {
        AuctionView()
            .environmentObject(NFTViewModel())
    }
}
