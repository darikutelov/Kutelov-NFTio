//
//  SearchScreenView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import SwiftUI

struct SearchScreenView: View {
    @EnvironmentObject var viewModel: NFTViewModel
    
    let columns = [
        GridItem(.adaptive(minimum: Constants.Spacing.minCardSize))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(
                    columns: columns,
                    spacing: Constants.Spacing.standard
                ) {
                    ForEach(viewModel.filteredNftItems) { nft in
                        NavigationLink(value: nft) {
                            SearchItemCellView(nftItem: nft)
                        }
                    }
                    .navigationDestination(for: NFT.self) { nft in
                        NFTDetailView(nft: nft)
                    }
                }
                .padding()
            }
            .background(
                Color(uiColor: .secondarySystemBackground)
                    .edgesIgnoringSafeArea(.all)
            )
        }
        .searchable(
            text: $viewModel.searchTerm,
            placement: .navigationBarDrawer(
                displayMode: .always
            ),
            prompt: Constants.Text.SearchScreen.searchLabel
        ) {
            if viewModel.searchTerm.isEmpty {
                ForEach(viewModel.nftNameCointaining(), id: \.self) { name in
                    Text(name).searchCompletion(name)
                }
            }
        }
        .onDisappear {
            viewModel.searchTerm = ""
        }
    }
}

struct SearchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreenView()
            .environmentObject(NFTViewModel())
    }
}
