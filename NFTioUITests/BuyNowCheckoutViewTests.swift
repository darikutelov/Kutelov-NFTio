//
//  BuyNowCheckoutView.swift
//  NFTioUITests
//
//  Created by Dariy Kutelov on 4.05.23.
//

import XCTest

final class BuyNowCheckoutViewTests: XCTestCase {
    var app: XCUIApplication!
    var homePageScrollView: XCUIElementQuery!
    var tabBar: XCUIElement!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        tabBar = app.tabBars["Tab Bar"]
        sleep(4)
        tabBar.buttons["Cart"].tap()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBuyNowTitle() throws {
        // swiftlint:disable line_length
        app/*@START_MENU_TOKEN@*/.buttons["CHECKOUT"]/*[[".otherElements[\"3\"].buttons[\"CHECKOUT\"]",".buttons[\"CHECKOUT\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let checkoutTitle = app.staticTexts["Checkout"]
        XCTAssert(checkoutTitle.exists)
        // swiftlint:enable line_length
    }
}
