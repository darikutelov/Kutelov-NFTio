//
//  SearchScreenView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import SwiftUI

struct SearchScreenView: View {
    @EnvironmentObject var viewModel: NFTViewModel
    
    var columns: [GridItem] {
        [GridItem(.adaptive(minimum: 300, maximum: 560))]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: Constants.Spacing.standard) {
                        ForEach(viewModel.nftItems) { nft in
                            SearchItemCellView(nftItem: nft)
                        }
                    }
                    .padding()
                }
            }
            .searchable(text: $viewModel.searchTerm, prompt: "NFT name") {
                //              ForEach(viewModel.nftItemsContaining(city), id: \.self) { city in
                //                Text(city).searchCompletion(city)
                //              }
            }
            .background(
                Color(uiColor: .secondarySystemBackground)
                    .edgesIgnoringSafeArea(.all)
            )
        }
    }
}

struct SearchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreenView()
            .environmentObject(NFTViewModel())
    }
}
