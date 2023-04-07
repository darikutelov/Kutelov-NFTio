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
    }

    override func tearDownWithError() throws {
        tabBar.buttons["Home"].tap()
    }

    func testTapOnHomeTabBar() {
        tabBar.buttons["Home"].tap()
        let appLogoText = app.scrollViews.otherElements.staticTexts["NFTio"]
        XCTAssert(appLogoText.exists)
        XCTAssertEqual(appLogoText.label, "NFTio")
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
        let pageText = app.staticTexts.element
        XCTAssert(pageText.exists)
        XCTAssertEqual(pageText.label, "Add NFT for Sale!")
    }
    // swiftlint:disable line_length
    func testTapOnCartTabBar() {
        tabBar.buttons["Cart"].tap()
        let cartScreenTitle = app
        /*@START_MENU_TOKEN@*/.navigationBars["Your Cart"]/*[[".otherElements[\"2\"].navigationBars[\"Your Cart\"]",".navigationBars[\"Your Cart\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            .staticTexts["Your Cart"]
        XCTAssert(cartScreenTitle.exists)
        XCTAssertEqual(cartScreenTitle.label, "Your Cart")
        // swiftlint:enable line_length
    }
    func testTapOnProfileTabBar() {
        tabBar.buttons["Profile"].tap()
        let pageText = app.staticTexts.element
        XCTAssert(pageText.exists)
        XCTAssertEqual(pageText.label, "Profile!")
    }
}
