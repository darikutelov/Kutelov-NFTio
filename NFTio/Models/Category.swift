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
    let categories = Category.categories
    
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

extension Category {
  static let categories = [
    ["id": "1",
     "name": "Art",
     "imageUrl": "art.jpg"
    ],
    ["id": "2",
     "name": "Music",
     "imageUrl": "music.jpg"
    ],
    ["id": "3",
     "name": "Photography",
     "imageUrl": "virtual-worlds.jpg"
    ],
    ["id": "4",
     "name": "Colectibles",
     "imageUrl": "collectibles.jpg"
    ],
    ["id": "5",
     "name": "Domain Names",
     "imageUrl": "domain-names.jpg"
    ],
    ["id": "6",
     "name": "Sports",
     "imageUrl": "sport.jpg"
    ],
    ["id": "7",
     "name": "Trading Cards",
     "imageUrl": "cards.jpg"
    ],
    ["id": "8",
     "name": "Memberships",
     "imageUrl": "utility.jpg"
    ],
    ["id": "9",
     "name": "Virtual Worlds",
     "imageUrl": "virtual-worlds.jpg"
    ]
  ].map { category in
    Category(
      id: category["id"] ?? "",
      name: CategoryName(rawValue: category["name"] ?? "unknown") ?? .unknown,
      imageUrl: Constants.Api.Images.categoryBaseUrl + (category["imageUrl"] ?? ""))
  }
}
