//
//  NFTListingViewViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

final class NFTViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let nftDataManager = NFTDataManager()
    @Published var nftItems: [NFT]
    @Published var selectedCategory: Category?
    @Published var selectedCollection: NFTCollection?
    @Published var searchTerm: String = ""
    
    var categories: [Category]
    var collections: [NFTCollection]
    
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
    
    // MARK: - Init
    
    init() {
        nftItems = nftDataManager.nftItems
        categories = nftDataManager.categories
        collections = Array(nftDataManager.nftCollections[..<Constants.Collections.numberOfCollectionsOnHomePage])
    }
    
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
    
    // MARK: - LIKES
    
    // Assgnment 4
    func updateNftItemLikes(_ nftItemId: String) {
        let itemIndex = nftItems.firstIndex(where: {$0.id == nftItemId })
        
        if let index = itemIndex {
            if isNftItemLiked(nftItemId) {
                nftItems[index].likes -= 1
            } else {
                nftItems[index].likes += 1
            }
        }
        
        toggleNftItemLike(itemId: nftItemId)
        nftDataManager.nftItems = nftItems
    }
    
    func isNftItemLiked(_ nftItemId: String) -> Bool {
        nftDataManager.likedNftItems.contains(nftItemId)
    }
    
    private func toggleNftItemLike(itemId: String) {
        if nftDataManager.likedNftItems.contains(itemId) {
            nftDataManager.likedNftItems = nftDataManager.likedNftItems.filter { $0 != itemId }
        } else {
            nftDataManager.likedNftItems.append(itemId)
        }
    }
}
