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
                    ForEach($viewModel.filteredItems, id: \.self) { nft in
                        NavigationLink {
                            NFTDetailView(nft: nft.wrappedValue)
                        } label: {
                            SearchItemCellView(nftItem: nft)
                        }
                    }
                }
                .padding()
            }
            .background(
                Color(uiColor: .secondarySystemBackground)
                    .edgesIgnoringSafeArea(.all)
            )
        }
        .refreshable {
            await viewModel.fetchNftItems()
         }
        .searchable(
            text: $viewModel.searchTerm,
            placement: .navigationBarDrawer(
                displayMode: .always
            ),
            prompt: Constants.Text.SearchScreen.searchLabel
        )
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
