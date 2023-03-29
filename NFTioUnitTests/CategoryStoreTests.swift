//
//  NFTioTests.swift
//  NFTioTests
//
//  Created by Dariy Kutelov on 23.03.23.
//

import XCTest
@testable import NFTio

final class CategoryStoreTests: XCTestCase {
    var categoryStore: CategoryStore!
    
    override func setUpWithError() throws {
        categoryStore = CategoryStore()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCategoriesOnInit() {
        let categories = categoryStore.categories
        XCTAssertEqual(categories.count, 9)
    }

    func testGetCategoryByCategoryName() {
        let categoryName = CategoryName.art
        let category = categoryStore.getCategoryByCategoryName(name: categoryName)

        XCTAssertNotNil(category)
        XCTAssertEqual(category?.name, categoryName)
    }
    
    func testGetCategoryByName() {
        let name = "Art"
        let category = categoryStore.getCategoryByName(name: name)

        XCTAssertNotNil(category)
        XCTAssertEqual(category?.name, CategoryName.art)
    }
}
