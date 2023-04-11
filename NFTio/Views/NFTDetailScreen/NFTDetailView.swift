//
//  NFTDetailView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 12.03.23.
//

import SwiftUI

struct NFTDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var cartViewModel: CartViewModel
    
    @Binding var nft: NFT

    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    TopInfoSectionView(
                        nft: nft,
                        proxy: proxy
                    )
                    Divider()
                    HStack {
                        Button {
                            cartViewModel.addItemToCart(nft: nft)
                            UserDefaults.standard.set(
                                3,
                                forKey: Constants.Text.TabView.userdefaultsKey
                            )
                        } label: {
                            ButtonIconView(
                                buttonText: Constants.Text.NFTDetail.buyButton,
                                buttonTextColor: Constants.Colors.white,
                                buttonBackgroundColor: Constants.Colors.primary,
                                iconName: Constants.Text.NFTDetail.buyButtonIcon
                            )
                        }
                        Button {
                            // (- Add a bid)(todo)
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
    }
}

struct NFTDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NFTDetailView(nft: .constant(NFTDataManager().nftItems[0]))
            .environmentObject(CartViewModel())
    }
}
