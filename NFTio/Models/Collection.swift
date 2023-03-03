//
//  Collection.swift
//  NFTio
//
//  Created by Dariy Kutelov on 3.03.23.
//

import Foundation

/// Data structure to represent NFT collection
struct Collection {
    let collectionName: String
    let description: String
    let imageUrl: String
    let contractAddress: String
    var numberOfItems: Int
    let createdAt: Date
    let category: Category
    let totalVolume: Int
    let floorPrice: Double
    let owners: Int
    var nftItems: [NFT] = []
}
