//
//  NFTioUITests.swift
//  NFTioUITests
//
//  Created by Dariy Kutelov on 24.03.23.
//
import XCTest

final class NFTioUITabNavigationTests: XCTestCase {
    var app: XCUIApplication!
    var homePageScrollView: XCUIElementQuery!
    var tabBar: XCUIElement!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        tabBar = app.tabBars["Tab Bar"]
        sleep(4)
    }

    override func tearDownWithError() throws {
        tabBar.buttons["Home"].tap()
    }

    func testTapOnHomeTabBar() {
        tabBar.buttons["Home"].tap()
        let collectionName = app.scrollViews.otherElements.staticTexts["Azuki"]
        XCTAssert(collectionName.exists)
        XCTAssertEqual(collectionName.label, "Azuki")
    }
    func testTabOnSearchTabBar() {
        tabBar.buttons["Search"].tap()
        let searchField = app.navigationBars.searchFields.element
        XCTAssert(searchField.exists)
        XCTAssert(searchField.isHittable)
        XCTAssertEqual(searchField.placeholderValue, "NFT name")
    }
    func testTapAddNFTForSaleTabBar() {
        tabBar.buttons["Add"].tap()
        let pageTitle = app.staticTexts["Add NFT for Sale"]
        XCTAssert(pageTitle.exists)
        XCTAssertEqual(pageTitle.label, "Add NFT for Sale")
    }
    // swiftlint:disable line_length
    func testTapOnCartTabBar() {
        tabBar.buttons["Cart"].tap()
        let app = XCUIApplication()
        let cartPageTitle = app/*@START_MENU_TOKEN@*/.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"]/*[[".otherElements[\"2\"].navigationBars[\"_TtGC7SwiftUI32NavigationStackHosting\"]",".navigationBars[\"_TtGC7SwiftUI32NavigationStackHosting\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Your Cart"]
        XCTAssert(cartPageTitle.exists)
        XCTAssertEqual(cartPageTitle.label, "Your Cart")
        // swiftlint:enable line_length
    }
}
