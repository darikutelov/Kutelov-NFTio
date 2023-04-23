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
        let bids =  nftViewModel.selectedNFT?.bids.sorted { $0.price.priceInCryptoCurrency > $1.price.priceInCryptoCurrency} ?? []
        
        VStack {
            if !bids.isEmpty {
                ForEach(bids) { bid in
                    BidCellView(bid: bid)
                    if bid.id != bids.last?.id {
                        Divider()
                            .background(Color(Constants.Colors.terciary)
                                .opacity(0.5))
                            .padding(.horizontal)
                    }
                }
            } else {
                Text("Be the first to place a bid for this item!")
                    .font(.subheadline)
                    .foregroundColor(Color(Constants.Colors.primaryText))
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
