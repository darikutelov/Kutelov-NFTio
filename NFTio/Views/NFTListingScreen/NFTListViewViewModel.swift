//
//  NFTListingViewViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

final class NFTListViewViewModel: ObservableObject {
    @Published var nftItems = [NFT](NFTDataManager().nftItems)
    
    init() {}
}