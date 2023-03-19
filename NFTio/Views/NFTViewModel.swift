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
    @Published var selectedCollection: Collection? = nil
    @Published var searchTerm: String = ""
    
    var categories = Category.categories
    var collections = Collection.collections
    
    var filteredNftItems: [NFT] {
        if let selectedCategory = selectedCategory {
            return nftItems.filter {
                $0.category.id == selectedCategory.id
            }
        }
        
        if let selectedCollection = selectedCollection {
            return nftItems.filter {
                $0.collection.id == selectedCollection.id
            }
        }
        
        if !searchTerm.isEmpty {
            return nftItems.filter { $0.tokenName
                .lowercased()
                .localizedCaseInsensitiveContains(searchTerm.lowercased())
            }
        }
        
        return nftItems
    }
    
    func setSelectedCategory(category: Category?) {
        selectedCategory = category
    }
    
    func setSelectedCollection(collection: Collection?) {
        selectedCollection = collection
    }
    
    /// Returns sorted unique token names for search suggestions
    /// search term can be token name or collection name
    func nftNameCointaining() -> [String] {
        let nameArray = nftItems.map { $0.tokenName }
        let matchingNames =
        searchTerm.isEmpty ? nameArray : nameArray.filter { $0.contains(searchTerm) }
        var nameSet = Set(matchingNames)
        
        let matchingNamesByCollection = nftItems
            .filter { $0.collection.collectionName.contains(searchTerm) }
            .map { $0.tokenName }
        
        if !searchTerm.isEmpty {
            nameSet = nameSet.union(Set(matchingNamesByCollection))
        }
        
        return Array(nameSet)
    }
}
//
