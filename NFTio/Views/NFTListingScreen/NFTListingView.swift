//
//  NFTListingView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

struct NFTListingView: View {
    @StateObject var viewModel = NFTListingViewViewModel()
    
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]

    var body: some View {
        ZStack {
            Color(uiColor: .secondarySystemBackground)
            
            ScrollView(.vertical,
                       showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(viewModel.nftItems) { nft in
                        NFTCellView(nft: nft)
                    }
                }
            }
                       .padding()
        }
    }
}

struct NFTListingView_Previews: PreviewProvider {
    static var previews: some View {
        NFTListingView(viewModel: NFTListingViewViewModel())
    }
}
