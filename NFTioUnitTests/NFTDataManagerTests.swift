//
//  NFTDataManagerTests.swift
//  NFTioUnitTests
//
//  Created by Dariy Kutelov on 26.03.23.
//

import XCTest
@testable import NFTio

final class NFTDataManagerTests: XCTestCase {
    var dataManager: NFTDataManager!
    
    override func setUpWithError() throws {
        dataManager = NFTDataManager()
    }
    
    func testDemoDataOnInit() {
        XCTAssertEqual(dataManager.nftItems.count, 42)
    }
    
//    func testAddNFTItem() {
//        XCTAssertEqual(dataManager.nftItems.count, 8)
//
//        let nftItem = demoNFT[0]
//        dataManager.addNew(nftItem: nftItem)
//        XCTAssertEqual(dataManager.nftItems.count, 9)
//    }
//
//    func testFetchNFTItems() async throws {
//        let nftItems = try await dataManager.fetchNftItems()
//        XCTAssertEqual(nftItems.count, 8)
//    }
}
