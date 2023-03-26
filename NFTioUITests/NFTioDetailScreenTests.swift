//
//  NFTioDetailScreenTests.swift
//  NFTioUITests
//
//  Created by Dariy Kutelov on 25.03.23.
//

import XCTest

final class NFTioDetailScreenTests: XCTestCase {
    var app: XCUIApplication!
    var elementsQuery:  XCUIElementQuery!
    var texts:  XCUIElementQuery!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        app.tabBars["Tab Bar"].buttons["Search"].tap()
        
        let scrollViewsQuery = app.scrollViews
        elementsQuery = scrollViewsQuery.otherElements
        elementsQuery.buttons["#3479, Bored Ape Yacht Club, Price, 67.45 ETH"].tap()
        
        texts = app.scrollViews.descendants(matching: .staticText)
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNavigationTitleExistsAndIsCorrect() {
        let title = app.navigationBars["Details"]
        XCTAssert(title.exists)
        
        let titleNameLabel = title.staticTexts["Details"].label
        XCTAssertEqual(titleNameLabel, "Details")
    }
    
    func testProductNameExistsAndIsCorrect() {
        let productName = elementsQuery.staticTexts["#3479"]
        XCTAssert(productName.exists)
        XCTAssertEqual(productName.label, "#3479")
    }
    
    func testProductImageExists() {
        let productImage = elementsQuery.images.element
        XCTAssert(productImage.exists)
    }
    
    func testCollectionNameExistsAndIsCorrect() throws {
        let collectionName = try XCTUnwrap(texts.element(boundBy: 1))
        XCTAssert(collectionName.exists)
        XCTAssertEqual(collectionName.label, "Bored Ape Yacht Club")
    }
    
    func testDescriptionExistsAndIsCorrect() throws {
        let description = try XCTUnwrap(texts.element(boundBy: 2))
        XCTAssert(description.exists)
        XCTAssertEqual(description.label, "The Bored Ape Yacht Club is a collection of 10,000 unique Bored Ape NFTs— unique digital collectibles living on the Ethereum blockchain.")
    }
    
    func testBuyButtonTap() {
        elementsQuery.buttons["Buy Now"].tap()
       
        /// Check if Shopping cart elements are on screen
        let cartNavigationTitle = app/*@START_MENU_TOKEN@*/.navigationBars["Your Cart"]/*[[".otherElements[\"2\"].navigationBars[\"Your Cart\"]",".navigationBars[\"Your Cart\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.staticTexts["Your Cart"]
        let cartCheckoutButton = app/*@START_MENU_TOKEN@*/.buttons["CHECKOUT"]/*[[".otherElements[\"2\"].buttons[\"CHECKOUT\"]",".buttons[\"CHECKOUT\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let totalAmountLabel = app/*@START_MENU_TOKEN@*/.collectionViews.staticTexts["Total Amount"]/*[[".otherElements[\"2\"].collectionViews",".cells.staticTexts[\"Total Amount\"]",".staticTexts[\"Total Amount\"]",".collectionViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        XCTAssert(cartNavigationTitle.exists)
        XCTAssert(cartCheckoutButton.exists)
        XCTAssert(totalAmountLabel.exists)

        /// Check if product is in the shopping cart
        let productName = app.collectionViews.staticTexts["#3479"]
        let collectionName = app/*@START_MENU_TOKEN@*/.collectionViews.staticTexts["Bored Ape Yacht Club"]/*[[".otherElements[\"2\"].collectionViews",".cells.staticTexts[\"Bored Ape Yacht Club\"]",".staticTexts[\"Bored Ape Yacht Club\"]",".collectionViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        XCTAssert(productName.exists)
        XCTAssert(collectionName.exists)
    }
}
