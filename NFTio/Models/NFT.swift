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
    var imageUrl: String
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

extension NFT {
    struct InfoField: Identifiable {
        let id = UUID()
        let label: String
        let text: String
    }
    
    func createInfoFieldsArray() -> [InfoField] {
        return [
            InfoField(label: "Blockchain", text: self.price.cryptoCurrency.rawValue),
            InfoField(label: "Creator", text: self.creator),
            InfoField(label: "Likes", text: "\(self.likes)"),
            InfoField(label: "Quantity", text: "\(self.quantity)"),
            InfoField(label: "Category", text: self.category.name.rawValue),
            InfoField(label: "Collection", text: self.nftCollection.name),
            InfoField(label: "Contract address", text: self.contractAddress)
        ]
    }
}

/// Data structure for price of NFT itme
struct Price: Codable {
    let id: String?
    let cryptoCurrency: CryptoCurrency
    let priceInCryptoCurrency: Decimal
    
    enum CodingKeys: String, CodingKey {
            case id = "_id"
            case cryptoCurrency, priceInCryptoCurrency
        }
}

/// Data structure for a bit in NFT auction
struct Bid: Codable, Identifiable {
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
