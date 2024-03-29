//
//  TopInfoSectionView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 12.03.23.
//

import SwiftUI

struct TopInfoSectionView: View {
    @EnvironmentObject var viewModel: NFTViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @State var isItemLiked: Bool = false
    
    let nft: NFT
    let proxy: GeometryProxy
    @State var showAuthAlert = false
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                RoundedImageView(imageUrlAsString: Constants.Api.Images.nftItemsBaseUrl +  nft.imageUrl)
                    .scaledToFit()
                Button {
                    if userViewModel.user == nil {
                     showAuthAlert = true
                    } else {
                        viewModel.updateNftItemLikes(nft.id)
                        isItemLiked.toggle()
                    }
                } label: {
                    LikesIconView(
                        isLiked: isItemLiked
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
                .padding(.horizontal)
            HStack {
                Text(Constants.Text.NFTDetail.priceLabel)
                    .font(.subheadline)
                    .foregroundColor(Color(Constants.Colors.primaryText)).opacity(0.7)
                Text("\(nft.price.priceInCryptoCurrency.rounded(3, .bankers)) \(CryptoCurrency.ethereum.rawValue)" as String)
                    .fontWeight(.semibold)
            }
            .padding()
            Divider()
                .padding(.horizontal)
        }
        .onAppear {
            isItemLiked = viewModel.isNftItemLiked(nft.id)
        }
        .alert("You need to sing in to like an item",
               isPresented: $showAuthAlert) {
          Button(role: .cancel) {
              showAuthAlert = false
          } label: {
            Text("Dismiss")
          }
        }
    }
}

struct TopInfoSectionView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            TopInfoSectionView(nft: NFTDataManager().nftItems[0], proxy: geometry)
        }
        .environmentObject(NFTViewModel())
        .environmentObject(UserViewModel())
    }
}
