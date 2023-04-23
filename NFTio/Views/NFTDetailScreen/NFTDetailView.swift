//
//  NFTDetailView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 12.03.23.
//

import SwiftUI

struct NFTDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var nftViewModel: NFTViewModel
    @EnvironmentObject var cartViewModel: CartViewModel
    @AppStorage(Constants.Text.TabView.userdefaultsKey) var selectedTab = 0
    
    var nft: NFT
    @State var showAddBid = false
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    TopInfoSectionView(
                        nft: nft,
                        proxy: proxy
                    )
                    if nft.auctionExpiryDate != nil {
                        TimerSectionView(auctionExpiryDate: nft.auctionExpiryDate!)
                    }
                    MediumInfoSectionView(
                        nft: nft
                    )
                    HStack {
                        Button {
                            cartViewModel.addItemToCart(nft: nft)
                            dismiss()
                            selectedTab = 3
                        } label: {
                            ButtonIconView(
                                buttonText: Constants.Text.NFTDetail.buyButton,
                                buttonTextColor: Constants.Colors.white,
                                buttonBackgroundColor: Constants.Colors.primary,
                                iconName: Constants.Text.NFTDetail.buyButtonIcon
                            )
                        }
                        Button {
                            showAddBid = true
                        } label: {
                            ButtonIconView(
                                buttonText: Constants.Text.NFTDetail.makeOfferButton,
                                buttonTextColor: Constants.Colors.white,
                                buttonBackgroundColor: Constants.Colors.secondary,
                                iconName: Constants.Text.NFTDetail.offerButtonIcon
                            )
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle(Constants.Text.NFTDetail.screenTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(Color(Constants.Colors.primaryText))
                    }
                }
            }
        }
        .sheet(isPresented: $showAddBid, content: {
            AddBidView(showAddBid: $showAddBid)
                .presentationDetents(
                    [.medium, .large]
                )
        })
        .onAppear {
            nftViewModel.selectedNFT = nft
        }
    }
}

struct NFTDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NFTDetailView(nft: NFTDataManager().nftItems[0])
            .environmentObject(NFTViewModel())
            .environmentObject(CartViewModel())
    }
}
