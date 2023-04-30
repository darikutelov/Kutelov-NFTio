//
//  Collection.swift
//  NFTio
//
//  Created by Dariy Kutelov on 3.03.23.
//

import Foundation

struct NFTCollectionsResponse: Codable {
    let nftCollections: [NFTCollection]
}

/// Data structure to represent NFT collection
struct NFTCollection: Hashable, Identifiable, Codable {
    let id: String
    let name: String
    var description: String?
    var imageUrl: String?
    let contractAddress: String
    var numberOfItems: Int
    let createdAt: Date
    let totalVolume: Int
    var floorPrice: Decimal
    let owners: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, description, imageUrl, contractAddress, numberOfItems,
             createdAt, totalVolume, floorPrice, owners
    }
}
