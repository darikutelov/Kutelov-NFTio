//
//  NFTListingViewViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

final class NFTViewModel: ObservableObject {
    // MARK: - Properties
    /// A manager to load and save data locally
    var nftDataManager = NFTDataManager()
    /// Store all NFT categories
    @Published var categories: [Category]
    /// Store all NFT collections
    @Published var nftCollections: [NFTCollection]
    /// Store all nft items
    @Published var nftItems: [NFT]
    /// Store selected category and update filteredNftItems upon selection
    @Published var selectedCategory: Category?
    /// Store selected collection and update filteredNftItems upon selection
    @Published var selectedCollection: NFTCollection?
    
    /// Store search term and update search items upon change
    @Published var searchTerm: String = "" {
        didSet {
            updatedSearchItems()
        }
    }
    @State var isLoading = false
    /// Store filtered items by search term
    @Published var searchItems = [NFT]()
    /// Error flag
    @MainActor @Published var showErrorAlert = false
    /// Error Message
    @MainActor @Published var errorMessage = ""
    
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
        
        return nftItems
    }
    
    // MARK: - Init
    
    init() {
        self.nftItems = self.nftDataManager.nftItems
        self.categories = self.nftDataManager.categories
        
        if nftDataManager.nftCollections.count >= Constants.Collections.numberOfCollectionsOnHomePage {
            self.nftCollections = Array(self.nftDataManager.nftCollections[..<Constants.Collections.numberOfCollectionsOnHomePage])
        } else {
            self.nftCollections = [NFTCollection]()
        }
        self.searchItems = self.nftDataManager.nftItems
        
        Task {
            await fetchNftItems()
            // Week09 #3
            await fetchCollections()
        }
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
    
    func updateNftItemLikes(_ nftItemId: String) {
        let itemIndex = nftItems.firstIndex(where: {$0.id == nftItemId })
        guard let index = itemIndex else { return }
        
        if isNftItemLiked(nftItemId) {
            nftItems[index].likes -= 1
        } else {
            nftItems[index].likes += 1
        }
        
        toggleNftItemLike(itemId: nftItemId)
        nftDataManager.nftItems = nftItems
        
        Task {
            let requestUrl = RequestUrl(
                endpoint: .nftItems,
                pathComponents: [nftItemId]
            )
            do {
                try await APIService.shared.saveData(requestUrl, data: nftItems[index])
            } catch let error {
                print(error)
            }
        }
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
    
    // MARK: - API calls
    
    public func fetchNftItems() async {
        do {
            isLoading = true
            let requestUrl = RequestUrl(endpoint: .nftItems)
            let data = try await APIService.shared.fetchData(
                requestUrl, expecting: NFTItemsResponse.self
            )
            
            await MainActor.run {
                nftItems = data.nftItems
                searchItems = data.nftItems
            }
            
            nftDataManager.nftItems = data.nftItems
            isLoading = false
        } catch APIServiceError.failedToConnectToServer(let message) {
            Task { @MainActor in
                showErrorAlert = true
                errorMessage = message
                try await Task.sleep(nanoseconds: 2_000_000_000)
                showErrorAlert = false
                errorMessage = ""
            }
        } catch {
            print("error")
        }
    }
    
    // Assignment 3
    private func fetchCollections() async {
        isLoading = true
        defer {
            isLoading = false
        }
        do {
            let requestUrl = RequestUrl(endpoint: .collections)
            let data = try await APIService.shared.fetchData(
                requestUrl, expecting: NFTCollectionsResponse.self
            )
            
            await MainActor.run {
                nftCollections = data.nftCollections
            }
            
            nftDataManager.nftCollections = data.nftCollections
            
        } catch let error {
            switch error {
            case APIServiceError.responseDecodingFailed(let message):
                print(message)
            default:
                print(error)
            }
        }
    }
    
    // MARK: - Search update
    
    private func updatedSearchItems() {
        searchItems = searchTerm.isEmpty ? nftItems : nftItems.filter {
            $0.tokenName.lowercased().localizedCaseInsensitiveContains(searchTerm.lowercased()) ||
            $0.nftCollection.name.lowercased().localizedCaseInsensitiveContains(searchTerm.lowercased())
        }
    }
    
    /// Function to create a binding between an NFT item and same item in the nfItems array by id
    public func nftItemBinding(id: String) -> Binding<NFT> {
        let currentIndex = self.nftItems.firstIndex { $0.id == id } ?? 0
        
        return Binding<NFT> {
            self.nftItems[currentIndex]
        } set: { newValue in
            self.nftItems[currentIndex] = newValue
        }
    }
}
