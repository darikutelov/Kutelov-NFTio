//
//  NFTListingViewViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

final class NFTViewModel: ObservableObject {
    @Published var nftItems = [NFT](NFTDataManager().nftItems)
    @Published var selectedCategory: Category? = nil
    @Published var selectedCollection: NFTCollection? = nil
    @Published var searchTerm: String = ""
    
    var categories = Category.categories
    var collections = NFTCollection.collections
    
    var filteredNftItems: [NFT] {
        if let selectedCategory = selectedCategory {
            return nftItems.filter {
                $0.category.id == selectedCategory.id
            }
        }
        
        if let selectedCollection = selectedCollection {
            return nftItems.filter {
                $0.nftCollection.id == selectedCollection.id
            }
        }
        
        if !searchTerm.isEmpty {
            return nftItems.filter {
                $0.tokenName.lowercased().localizedCaseInsensitiveContains(searchTerm.lowercased()) ||
                $0.nftCollection.name.lowercased().localizedCaseInsensitiveContains(searchTerm.lowercased())
            }
        }
        
        return nftItems
    }
    
//    init() {
//        nftItems = nftDataManager.nftItems
//    }
    
    func setSelectedCategory(category: Category?) {
        selectedCategory = category
    }
    
    func setSelectedCollection(collection: NFTCollection?) {
        selectedCollection = collection
    }
    
    func nftNameCointaining() -> [String] {
        let nameArray = nftItems.map { $0.tokenName }
        let matchingNames =
        searchTerm.isEmpty ? nameArray : nameArray.filter { $0.contains(searchTerm) }
        let nameSet = Set(matchingNames)
        return Array(nameSet)
    }
}
//
