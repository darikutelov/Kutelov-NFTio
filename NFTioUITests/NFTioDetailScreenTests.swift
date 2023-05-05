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
        app = XCUIApplication()
        app.launch()
        sleep(4)
        app.tabBars["Tab Bar"].buttons["Home"].tap()
        let scrollViewsQuery = app.scrollViews
        elementsQuery = scrollViewsQuery.otherElements
        texts = app.scrollViews.descendants(matching: .staticText)
        continueAfterFailure = false
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testNavigationTitleExistsAndIsCorrect() {
        elementsQuery.buttons["Make Offer"].tap()
        let title = app.navigationBars["Details"].staticTexts["Details"]
        XCTAssert(title.exists)
    }
    
    func testProductNameExistsAndIsCorrect() {
        elementsQuery.buttons["Make Offer"].tap()
        let productName = elementsQuery.staticTexts["#9296"]
        XCTAssert(productName.exists)
    }
    
    func testProductImageExists() {
        elementsQuery.buttons["Make Offer"].tap()
        let productImage = elementsQuery.images.element
        XCTAssert(productImage.exists)
    }
    
    func testBuyButtonTap() {
        elementsQuery.buttons["Make Offer"].tap()
        elementsQuery.buttons["Buy Now"].tap()
        // swiftlint:disable line_length
        let cartCheckoutButton = app/*@START_MENU_TOKEN@*/.buttons["CHECKOUT"]/*[[".otherElements[\"2\"].buttons[\"CHECKOUT\"]",".buttons[\"CHECKOUT\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(cartCheckoutButton.exists)
        // swiftlint:enable line_length
    }
}
