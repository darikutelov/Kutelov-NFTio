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
}
