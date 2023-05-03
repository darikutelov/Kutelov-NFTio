//
//  NFTListingViewViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

@MainActor
final class NFTViewModel: ObservableObject {
    // MARK: - Properties
    /// A manager to load and save data locally
    var nftDataManager = NFTDataManager()
    /// Store all NFT categories
    @Published var categories: [Category]
    /// Store all NFT collections
    @Published var nftCollections: [NFTCollection]? {
        didSet {
            if self.nftDataManager.nftCollections.count >= Constants.Collections.numberOfCollectionsOnHomePage {
                homePageCollections = Array(self.nftDataManager.nftCollections[..<Constants.Collections.numberOfCollectionsOnHomePage])
                
            }
        }
    }
    @Published var homePageCollections: [NFTCollection]?
    /// Store all nft items
    private var nftItems: [NFT]
    /// Store selected category and update filteredNftItems upon selection
    @Published var selectedCategory: Category? {
        didSet {
            updateFilteredItems()
        }
    }
    /// Store selected collection and update filteredNftItems upon selection
    @Published var selectedCollection: NFTCollection? {
        didSet {
            updateFilteredItems()
        }
    }
    /// Store search term and update search items upon change
    @Published var searchTerm: String = "" {
        didSet {
            updateFilteredItems()
        }
    }
    /// Store filtered items by search term
    @Published var filteredItems = [NFT]()
    
    /// Store filtered items by search term
    @Published var popularItems = [NFT]()
    
    /// Error flag
    @Published var showErrorAlert = false
    /// Error Message
    @Published var errorMessage = ""
    
    @Published var selectedNFT: NFT?
    
    @Published var featuredNFT: NFT?
    
    // MARK: - Init
    
    init() {
        self.nftItems = self.nftDataManager.nftItems
        self.categories = self.nftDataManager.categories
        self.filteredItems = self.nftItems
        
        if !nftItems.isEmpty {
            self.featuredNFT = nftItems[0]
        }
        
        if nftDataManager.nftCollections.count >= Constants.Collections.numberOfCollectionsOnHomePage {
            self.homePageCollections = Array(self.nftDataManager.nftCollections[..<Constants.Collections.numberOfCollectionsOnHomePage])
        } else {
            self.nftCollections = [NFTCollection]()
        }
        
        Task {
            await fetchNftItems()
            await fetchCollections()
        }
        
        updateFilteredItems()
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
        guard let index = itemIndex else {
            return
        }
        
        if isNftItemLiked(nftItemId) {
            nftItems[index].likes -= 1
        } else {
            nftItems[index].likes += 1
        }
        
        toggleNftItemLike(itemId: nftItemId)
        nftDataManager.nftItems = nftItems
        let bodyData = nftItems[index]
        Task {
            let requestUrl = RequestUrl(
                endpoint: .nftItems,
                pathComponents: [nftItemId]
            )
            do {
                let _ = try await APIService.shared.postData(
                    requestUrl,
                    bodyData: bodyData
                )
            } catch let error {
                setError(message: error.localizedDescription)
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
            let requestUrl = RequestUrl(endpoint: .nftItems)
            let data = try await APIService.shared.fetchData(
                requestUrl, expecting: NFTItemsResponse.self
            )
            
            nftItems = data.nftItems
            filteredItems = data.nftItems
            
            nftDataManager.nftItems = data.nftItems
            
            if filteredItems.count > 15 {
                self.popularItems = [filteredItems[7], filteredItems[9], filteredItems[10], filteredItems[12]]
            }
            
        } catch APIServiceError.failedToConnectToServer(let message) {
            setError(message: message)
        } catch let error {
            setError(message: error.localizedDescription)
            print("error")
        }
    }
    
    func fetchCollections() async {
        do {
            let requestUrl = RequestUrl(endpoint: .collections)
            let data = try await APIService.shared.fetchData(
                requestUrl, expecting: NFTCollectionsResponse.self
            )
            
            nftCollections = data.nftCollections
            nftDataManager.nftCollections = data.nftCollections
            homePageCollections = Array(self.nftDataManager.nftCollections[..<Constants.Collections.numberOfCollectionsOnHomePage])
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
    
    private func updateFilteredItems() {
        filteredItems = searchTerm.isEmpty ? nftItems : nftItems.filter {
            $0.tokenName.lowercased().localizedCaseInsensitiveContains(searchTerm.lowercased()) ||
            $0.nftCollection.name.lowercased().localizedCaseInsensitiveContains(searchTerm.lowercased())
        }
        
        if let selectedCategory = selectedCategory {
            filteredItems = nftItems.filter {
                $0.category.id == selectedCategory.id
            }
        }
        
        if let selectedCollection = selectedCollection {
            filteredItems = nftItems.filter {
                $0.nftCollection.id == selectedCollection.id
            }
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
    
    private func setError(message: String) {
        Task {
            showErrorAlert = true
            errorMessage = message
            
            try await Task.sleep(nanoseconds: 3_000_000_000)
            showErrorAlert = false
            errorMessage = ""
        }
    }
}

// MARK: - NFT Item bids

extension NFTViewModel {
    func addNftItemBid(_ bid: Bid) async throws {
        guard let selectedNFT = selectedNFT else { return }
        
        let itemIndex = nftItems.firstIndex(where: {$0.id == selectedNFT.id })
        
        guard let index = itemIndex else { return }
        
        let requestUrl = RequestUrl(
            endpoint: .nftItems,
            pathComponents: [selectedNFT.id, "bids"]
        )
        
        do {
            let _ = try await APIService.shared.postData(
                requestUrl,
                bodyData: bid
            )
            
            // updates nft items
            nftItems[index].bids.append(bid)
            // update selectedNFT to update view
            self.selectedNFT = nftItems[index]
            // updates filtered items
            updateFilteredItems()
            // persist changes to local storage
            nftDataManager.nftItems = nftItems
        } catch let error {
            throw error
        }
    }
}
