//
//  NFTListingView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

struct NFTListView: View {
    @Binding var nftItems: [NFT]
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
                    ForEach($nftItems) { nft in
                        NavigationLink {
                            NFTDetailView(nft: nft)
                        } label: {
                            NFTCellView(nft: nft.wrappedValue)
                        }
                        .isDetailLink(true)
                    }
                }
            }
        }
    }
}

struct NFTListingView_Previews: PreviewProvider {
    static var previews: some View {
        NFTListView(
            nftItems: .constant(NFTViewModel().nftItems),
            sectionName: Constants.Text.Home.nftListLabel
        )
    }
}
