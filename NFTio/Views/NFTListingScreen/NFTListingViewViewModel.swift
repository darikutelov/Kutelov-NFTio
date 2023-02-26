//
//  NFTListingViewViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

class NFTListingViewViewModel: ObservableObject {
    @Published var nftItems = [NFT]()
    
    init() {
        let dataManager = DataManager()
        nftItems = dataManager.nftItems
    }
}
