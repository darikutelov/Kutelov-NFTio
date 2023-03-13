//
//  NFTListingViewViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

final class HomeViewViewModel: ObservableObject {
    @Published var nftItems = [NFT](NFTDataManager().nftItems)
    @Published var selectedCategory: Category? = nil
    @Published var selectedCollection: Collection? = nil
    
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
        
        return nftItems
    }
    
    
    func setSelectedCategory(category: Category?) {
        selectedCategory = category
    }
    
    func setSelectedCollection(collection: Collection?) {
        selectedCollection = collection
    }
}
