//
//  NFTListingView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

struct NFTListView: View {
    @ObservedObject var viewModel: HomeViewViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(viewModel.nftItems) { nft in
                NFTCellView(nft: nft)
            }
        }
    }
}

struct NFTListingView_Previews: PreviewProvider {
    static var previews: some View {
        NFTListView(viewModel: HomeViewViewModel())
    }
}
