//
//  NFTioSearchScreenTests.swift
//  NFTioUITests
//
//  Created by Dariy Kutelov on 25.03.23.
//

import XCTest

final class NFTioSearchScreenTests: XCTestCase {
    var app: XCUIApplication!
    var homePageScrollView: XCUIElementQuery!
    var scrollViewElements: XCUIElementQuery!
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        sleep(4)
        app.tabBars["Tab Bar"].buttons["Search"].tap()
        scrollViewElements = app.scrollViews.otherElements
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testSearchItemsOnTheScreen() {
        let listItems = scrollViewElements.children(matching: .button)
        let searchItem1 = listItems.element(boundBy: 0)
        let searchItem2 = listItems.element(boundBy: 1)
        XCTAssert(searchItem1.exists)
        XCTAssert(searchItem2.exists)
        let searchItem1Texts = searchItem1.descendants(matching: .staticText)
        let searchItem1Name = searchItem1Texts.element(boundBy: 0)
        // XCTAssertEqual(searchItem1Name.label, "#3479")
        let searchItem2Texts = searchItem2.descendants(matching: .staticText)
        let searchItem2Name = searchItem2Texts.element(boundBy: 0)
        // XCTAssertEqual(searchItem2Name.label, "#9760")
        // XCTAssertEqual(listItems.count, 8)
    }
    func testSerachItemTapToDetailScreen() {
//        scrollViewElements.buttons["#3479, Bored Ape Yacht Club, Price, 67.45 ETH"].tap()
//        let detailScreenTitle = app.navigationBars["Details"]
//        XCTAssert(detailScreenTitle.exists)
    }

    func testSearchFieldSelectItem() {
//        let searchField = app.navigationBars.searchFields["NFT name"]
//        searchField.tap()
//        app.collectionViews/*@START_MENU_TOKEN@*/.buttons["#3479"]/*[[".cells.buttons[\"#3479\"]",".buttons[\"#3479\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        let button = app.scrollViews.otherElements.buttons["#3479, Bored Ape Yacht Club, Price, 67.45 ETH"]
//        button.tap()
//        let detailScreenTitle = app.navigationBars["Details"]
//        XCTAssert(detailScreenTitle.exists)
//        XCTAssertFalse(button.exists)
//        let arrowBackwardButton = app.navigationBars["Details"]
//        /*@START_MENU_TOKEN@*/.buttons["arrow.backward"]/*[[".otherElements[\"arrow.backward\"].buttons[\"arrow.backward\"]",".buttons[\"arrow.backward\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        arrowBackwardButton.tap()
//        XCTAssert(button.exists)
    }
    // swiftlint:enable line_length
    func testSearchFieldEnterText() {
//        let allListItems = scrollViewElements.children(matching: .button)
//        XCTAssertEqual(allListItems.count, 8)
//        let searchField = app.navigationBars.searchFields["NFT name"]
//        searchField.tap()
//        searchField.typeText("#3479")
//        let listItems = scrollViewElements.children(matching: .button)
//        XCTAssertEqual(listItems.count, 1)
//        let itemTexts = listItems.element.descendants(matching: .staticText)
//        let itemName = itemTexts.element(boundBy: 0)
//        XCTAssertEqual(itemName.label, "#3479")
    }
}
