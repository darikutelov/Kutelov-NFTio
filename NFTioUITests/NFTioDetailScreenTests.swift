//
//  NFTioDetailScreenTests.swift
//  NFTioUITests
//
//  Created by Dariy Kutelov on 25.03.23.
//

import XCTest
import Stripe

final class NFTioDetailScreenTests: XCTestCase {
    var app: XCUIApplication!
    var elementsQuery: XCUIElementQuery!
    var texts: XCUIElementQuery!
    
    override func setUpWithError() throws {
//        let loadingExpectation = XCTestExpectation(description: "Loading animation expectation")
//        loadingExpectation.fulfill()
//        wait(for: [loadingExpectation], timeout: 4)
        
        app = XCUIApplication()
        app.launch()
    
        app.tabBars["Tab Bar"].buttons["Home"].tap()
        let scrollViewsQuery = app.scrollViews
        elementsQuery = scrollViewsQuery.otherElements
        // elementsQuery.buttons["Make Offer"].tap()
        texts = app.scrollViews.descendants(matching: .staticText)
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNavigationTitleExistsAndIsCorrect() {
        let title = app.navigationBars["Details"]
        // XCTAssert(title.exists)
//        let titleNameLabel = title.staticTexts["Details"].label
//        XCTAssertEqual(titleNameLabel, "Details")
    }
    
    func testProductNameExistsAndIsCorrect() {
        let productName = elementsQuery.staticTexts["#3479"]
        // XCTAssert(productName.exists)
        // XCTAssertEqual(productName.label, "#3479")
    }
    
    func testProductImageExists() {
        let productImage = elementsQuery.images.element
        // XCTAssert(productImage.exists)
    }
    
    func testBuyButtonTap() {
        // elementsQuery.buttons["Buy Now"].tap()
//        let cartNavigationTitle = app/*@START_MENU_TOKEN@*/.navigationBars["Your Cart"]/*[[".otherElements[\"2\"].navigationBars[\"Your Cart\"]",".navigationBars[\"Your Cart\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//            .staticTexts["Your Cart"]
//        let cartCheckoutButton = app/*@START_MENU_TOKEN@*/.buttons["CHECKOUT"]/*[[".otherElements[\"2\"].buttons[\"CHECKOUT\"]",".buttons[\"CHECKOUT\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        let totalAmountLabel = app
//        /*@START_MENU_TOKEN@*/.collectionViews.staticTexts["Total Amount"]/*[[".otherElements[\"2\"].collectionViews",".cells.staticTexts[\"Total Amount\"]",".staticTexts[\"Total Amount\"]",".collectionViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        
        // XCTAssert(cartNavigationTitle.exists)
//        XCTAssert(cartCheckoutButton.exists)
//        XCTAssert(totalAmountLabel.exists)
        // let productName = app.collectionViews.staticTexts["#3479"]
//        let collectionName = app
//        /*@START_MENU_TOKEN@*/.collectionViews.staticTexts["Bored Ape Yacht Club"]/*[[".otherElements[\"2\"].collectionViews",".cells.staticTexts[\"Bored Ape Yacht Club\"]",".staticTexts[\"Bored Ape Yacht Club\"]",".collectionViews"],[[[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0,0]]@END_MENU_TOKEN@*/
        // XCTAssert(productName.exists)
        // XCTAssert(collectionName.exists)
        // swiftlint:enable line_length
    }
    
}
