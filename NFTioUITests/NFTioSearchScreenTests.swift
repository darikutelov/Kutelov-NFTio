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
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSearchItemsOnTheScreen() {
        app.tabBars["Tab Bar"].buttons["Search"].tap()
        let elementsQuery = app.scrollViews.otherElements
        let productName = elementsQuery.staticTexts["#9296"]
        XCTAssert(productName.exists)
    }
    
    func testSerachItemTapToDetailScreen() {
        app.tabBars["Tab Bar"].buttons["Search"].tap()
        app.scrollViews.otherElements.buttons["#9296, Azuki, Price, 20.00 ETH"].tap()
        let detailScreenTitle = app.navigationBars["Details"]
        XCTAssert(detailScreenTitle.exists)
    }

    func testSearchFieldSelectItem() {
        app.tabBars["Tab Bar"].buttons["Search"].tap()        
        let button = app.scrollViews.otherElements.buttons["#9296, Azuki, Price, 20.00 ETH"]
        button.tap()
        let detailScreenTitle = app.navigationBars["Details"]
        XCTAssert(detailScreenTitle.exists)
        // swiftlint:disable line_length
        let arrowBackwardButton = app.navigationBars["Details"]
        /*@START_MENU_TOKEN@*/.buttons["arrow.backward"]/*[[".otherElements[\"arrow.backward\"].buttons[\"arrow.backward\"]",".buttons[\"arrow.backward\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        // swiftlint:enable line_length
        arrowBackwardButton.tap()
        XCTAssert(button.exists)
    }

    func testSearchFieldEnterText() {
        app.tabBars["Tab Bar"].buttons["Search"].tap()        
        let searchField = app.navigationBars.searchFields["NFT name"]
        searchField.tap()
        searchField.typeText("#9296")
        let listItems = app.scrollViews.otherElements.buttons
        XCTAssertEqual(listItems.count, 1)
        let itemTexts = listItems.element.descendants(matching: .staticText)
        let itemName = itemTexts.element(boundBy: 0)
        XCTAssertEqual(itemName.label, "#9296")
    }
}
