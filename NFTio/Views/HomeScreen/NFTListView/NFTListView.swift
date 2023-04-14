//
//  NFTListingView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

struct NFTListView: View {
    @EnvironmentObject var nftViewModel: NFTViewModel
    let sectionName: String
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack {
            Section(
                header: SectionHeaderView(
                    sectionName: sectionName
                )
                .padding(.bottom, Constants.Spacing.small)
            ) {
                LazyVGrid(
                    columns: columns,
                    spacing: Constants.Spacing.standard
                ) {
                    ForEach($nftViewModel.filteredItems) { nftItem in
                        NavigationLink(value: nftItem.wrappedValue) {
                            NFTCellView(
                                nft: nftItem
                            )
                        }
                    }
                }
                .navigationDestination(for: NFT.self) { nftItem in
                    NFTDetailView(
                        nft: nftItem
                    )
                }
            }
        }
//        .onDisappear {
//            nftViewModel.isTrendingItems = false
//        }
        .onAppear {
            nftViewModel.isTrendingItems = true
        }
    }
}

struct NFTListingView_Previews: PreviewProvider {
    static var previews: some View {
        NFTListView(
            sectionName: Constants.Text.Home.nftListLabel
        )
        .environmentObject(NFTViewModel())
    }
}
