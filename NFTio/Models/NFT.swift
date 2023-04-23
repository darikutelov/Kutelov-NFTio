//
//  NFT.swift
//  NFTio
//
//  Created by Dariy Kutelov on 3.03.23.
//

import Foundation

struct NFTItemsResponse: Codable {
    let nftItems: [NFT]
}

/// Data Structure to Represent NFT  item for sale
struct NFT: Hashable, Identifiable, Codable {
    let id: String
    let tokenName: String
    let description: String?
    let imageUrl: String
    var likes: Int
    let creator: String
    let category: Category
    var nftCollection: NFTCollection
    let contractAddress: String
    let price: Price
    var quantity: Int
    var auctionExpiryDate: Date?
    var bids: [Bid]
}

extension NFT {
    enum CodingKeys: String, CodingKey {
            case id = "_id"
            case tokenName, description, imageUrl, likes, creator,
                 category, nftCollection, contractAddress, price,
                 quantity, auctionExpiryDate, bids
        }
}

extension NFT {
    static func == (lhs: NFT, rhs: NFT) -> Bool {
        lhs.id == rhs.id
    }
}

/// Data structure for price of NFT itme
struct Price: Codable {
    let cryptoCurrency: CryptoCurrency
    let priceInCryptoCurrency: Decimal
}

/// Data structure for a bit in NFT auction
struct Bid: Codable {
    let id: String?
    let price: Price
    let user: User
    let date: Date?
}

/// Enum for allowed crypto currencies
enum CryptoCurrency: String, CaseIterable, Codable {
    case ethereum = "ETH"
    case dai = "DAI"
    case basicAttentionToken = "BAT"
    case ash = "ASH"
    case cube = "CUBE"
}
