//
//  NFTioSearchScreenTests.swift
//  NFTioUITests
//
//  Created by Dariy Kutelov on 25.03.23.
//

import XCTest

final class NFTioSearchScreenTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    //    func testTapOnHomePage() {
    //
    //        // Tab bar
    //        //app.tabBars["Tab Bar"].buttons["Search"].tap()
    //
    //
    ////        let homePageElements = homePageScrollView.otherElements
    ////        let categoriesHorizontalScrollView = homePageScrollView.scrollViews.otherElements
    ////        let categoryCellView = categoriesHorizontalScrollView.buttons
    ////        categoryCellView["Art"]
    ////            .tap()
    //
    ////        let categoriesCount = categoryCellView.count
    ////        XCTAssertEqual(categoriesCount, 9)
    //
    //
    //
    //        let app = XCUIApplication()
    //        let scrollViewsQuery = app.scrollViews
    //        let elementsQuery = scrollViewsQuery.otherElements
    //        //elementsQuery.staticTexts["NFTio"].tap()
    //        //scrollViewsQuery.otherElements.containing(.image, identifier:"app-icon").element.tap()
    //        //app.tabBars["Tab Bar"].buttons["Home"].tap()
    //
    //        elementsQuery.scrollViews.otherElements.buttons["Art"].tap()
    //
    //        //XCTAssert
    //        XCTAssert(elementsQuery.staticTexts["NFTio"].exists)
    //
    ////        let categoryNavBar = app.navigationBars["Art"]
    ////        XCTAssertFalse(categoryCellView.exists)
    ////        XCTAssert(categoryNavBar.exists)
    //        //       XCTAssertEqual(app.navigationBars["Art"].staticTexts["Art"].title, "Art")
    //
    //
    //        let artButton = elementsQuery.scrollViews.otherElements.buttons["Art"]
    //        XCTAssert(artButton.exists)
    //        XCTAssertNotNil(app.navigationBars["Art"].staticTexts["Art"])
    //
    //
    //    }
}
