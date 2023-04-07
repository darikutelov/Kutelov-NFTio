//
//  NFTViewModelTests.swift
//  NFTioUnitTests
//
//  Created by Dariy Kutelov on 26.03.23.
//

import XCTest
@testable import NFTio

final class NFTViewModelTests: XCTestCase {
    var viewModel: NFTViewModel!
    var nftItems: [NFT]!
    override func setUpWithError() throws {
        viewModel = NFTViewModel()
        nftItems = viewModel.nftItems
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNFTItemsOnInit() {
        XCTAssert(!nftItems.isEmpty)
        XCTAssertEqual(nftItems.count, 8)
    }
    func testSetSelectedCategory() {
        let category = Category(id: "1", name: .art, imageUrl: "")
        viewModel.setSelectedCategory(category: category)
        XCTAssertNotNil(viewModel.selectedCategory)
        XCTAssertEqual(viewModel.selectedCategory?.name, .art)
    }

    func testFilteredNFTItemsOnCategory() {
        let category = Category(id: "1", name: .art, imageUrl: "")
        viewModel.selectedCategory = category
        let filteredItems = viewModel.filteredNftItems

        XCTAssertEqual(filteredItems.count, 6)
        XCTAssertEqual(filteredItems[0].category.name, .art)
    }
    func testSetSelectedCollection() {
        let collection = NFTCollection(id: "2", name: "Bored Ape Yacht Club",
        contractAddress: "", numberOfItems: 1, createdAt: Date(),
        category: Category(id: "1", name: .art, imageUrl: ""),
        totalVolume: 1, floorPrice: 1, owners: 1)
        viewModel.setSelectedCollection(collection: collection)
        XCTAssertNotNil(viewModel.selectedCollection)
        XCTAssertEqual(viewModel.selectedCollection?.name, "Bored Ape Yacht Club")
    }
    func testFilteredNFTItemsOnCollection() {
        let collection = NFTCollection(id: "2", name: "Bored Ape Yacht Club",
        contractAddress: "", numberOfItems: 1, createdAt: Date(),
        category: Category(id: "1", name: .art, imageUrl: ""), totalVolume: 1,
        floorPrice: 1, owners: 1)
        viewModel.selectedCollection = collection
        let filteredItems = viewModel.filteredNftItems

        XCTAssertEqual(filteredItems.count, 7)
        XCTAssertEqual(filteredItems[0].nftCollection.name, "Bored Ape Yacht Club")
    }
    func testFilteredNFTItemsOnSearchTerm() {
        viewModel.searchTerm = "#3479"
        let filteredItems = viewModel.filteredNftItems

        XCTAssertEqual(filteredItems.count, 1)
        XCTAssertEqual(filteredItems[0].tokenName, "#3479")
        viewModel.searchTerm = ""
        XCTAssertEqual(nftItems.count, 8)
    }
}
