//
//  CollectionView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 12.03.23.
//

import SwiftUI

struct CollectionView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: HomeViewViewModel
    let selectedCollection: Collection
    
    
    var body: some View {
        ScrollView {
            NFTListView(nftItems: viewModel.filteredNftItems)
            .onAppear {
                viewModel.setSelectedCollection(collection: selectedCollection)
            }
            .navigationTitle("\(selectedCollection.collectionName)")
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
            .onDisappear {
                viewModel.setSelectedCategory(category: nil)
            }
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView(
            viewModel: HomeViewViewModel(),
            selectedCollection: NFTDataManager().nftItems.first!.collection
        )
    }
}
