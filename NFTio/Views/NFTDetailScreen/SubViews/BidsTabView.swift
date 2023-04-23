//
//  BidsView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 19.04.23.
//

import SwiftUI

struct BidsTabView: View {
    @EnvironmentObject var nftViewModel: NFTViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack {
            if let nft = nftViewModel.selectedNFT {
                if !nft.bids.isEmpty {
                    Text("\(nft.bids.count)")
                } else {
                    Text("Be the first to place a bid for this item!")
                }
            }
        }
    }
}

struct BidsTabView_Previews: PreviewProvider {
    static var previews: some View {
        BidsTabView()
            .environmentObject(NFTViewModel())
            .environmentObject(UserViewModel())
    }
}
