//
//  NFTListingViewViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

final class HomeViewViewModel: ObservableObject {
    @Published var nftItems = [NFT](NFTDataManager().nftItems)
    
    let categories = Category.categories
    let collections = Collection.collections
    
    init() {}
}
