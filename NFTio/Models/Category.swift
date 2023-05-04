//
//  Category.swift
//  NFTio
//
//  Created by Dariy Kutelov on 3.03.23.
//

import Foundation

/// Enum for names of NFT items' categories
enum CategoryName: String, CaseIterable, Codable {
    case art = "Art"
    case collectibles = "Colectibles"
    case domainNames = "Domain Names"
    case music = "Music"
    case photography = "Photography"
    case sports = "Sports"
    case tradingCards = "Trading Cards"
    case memberships = "Memberships"
    case virtualWorlds = "Virtual Worlds"
    case pfps = "PFPs"
    case unknown = "Unknown"
}

struct Category: Hashable, Identifiable, Codable {
    let id: String
    let name: CategoryName
    let imageUrl: String
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, imageUrl
    }
}
