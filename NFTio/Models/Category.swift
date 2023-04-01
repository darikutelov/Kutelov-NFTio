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


//TODO: - add category position prop
struct Category: Hashable, Identifiable, Codable {
    let id: String
    let name: CategoryName
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name, imageUrl
    }
}

struct CategoryStore {
    let categories = NFTDataManager().categories
    
    func getCategoryByCategoryName(name: CategoryName) -> Category? {
        let filteredCategories = categories.filter {
            $0.name == name
        }
        
        guard !filteredCategories.isEmpty else {
            return nil
        }
        
        return filteredCategories.first
    }
    
    func getCategoryByName(name: String) -> Category? {
        let categoryName = CategoryName(rawValue: name)
        
        guard let categoryName = categoryName else {
            return nil
        }
        
        let categoryIndex = categories.firstIndex { category in
            category.name == categoryName
        }
        
        guard let categoryIndex = categoryIndex else {
            return nil
        }
        
        return categories[categoryIndex]
    }
}
