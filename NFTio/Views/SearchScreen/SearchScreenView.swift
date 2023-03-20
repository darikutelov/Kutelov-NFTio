//
//  SearchScreenView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import SwiftUI

struct SearchScreenView: View {
    @EnvironmentObject var viewModel: NFTViewModel
    @State private var text: String = ""
    
    let columns = [
        GridItem(.adaptive(minimum: Constants.Spacing.minCardSize))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                // MARK: - Assignment 3
                LazyVGrid(
                    columns: columns,
                    spacing: Constants.Spacing.standard
                ) {
                    ForEach(viewModel.filteredNftItems) { nft in
                        // MARK: - Assignment 2
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
        // MARK: - Assignment 5
        .searchable(
            text: $text,
            placement: .navigationBarDrawer(
                displayMode: .always
            ),
            prompt: Constants.Text.SearchScreen.searchLabel
        ) {
            ForEach(viewModel.nftNameCointaining(), id: \.self) { name in
                Text(name).searchCompletion(name)
            }
        }
        .onChange(of: text, perform: { text in
            viewModel.searchTerm = text
        })
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
