//
//  NFTioUITests.swift
//  NFTioUITests
//
//  Created by Dariy Kutelov on 24.03.23.
//

import XCTest

//The layouts contain the labels, images or controls that you expect
//The right thing happens when you tap on a button, list or grid item
//Selecting a tab button shows the correct view
//Ensure that your list contains the required items before and after you add or remove an item


final class NFTioUITabNavigationTests: XCTestCase {
    var app: XCUIApplication!
    var homePageScrollView: XCUIElementQuery!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        
        homePageScrollView = app.scrollViews
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testTapOnCategory() throws {
        
        // Tab bar
        //app.tabBars["Tab Bar"].buttons["Search"].tap()
        
        
//        let homePageElements = homePageScrollView.otherElements
//        let categoriesHorizontalScrollView = homePageScrollView.scrollViews.otherElements
//        let categoryCellView = categoriesHorizontalScrollView.buttons
//        categoryCellView["Art"]
//            .tap()
        
//        let categoriesCount = categoryCellView.count
//        XCTAssertEqual(categoriesCount, 9)
        
        
        
        let app = XCUIApplication()
        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements
        //elementsQuery.staticTexts["NFTio"].tap()
        //scrollViewsQuery.otherElements.containing(.image, identifier:"app-icon").element.tap()
        //app.tabBars["Tab Bar"].buttons["Home"].tap()
        
        elementsQuery.scrollViews.otherElements.buttons["Art"].tap()
        
        //XCTAssert
        XCTAssert(elementsQuery.staticTexts["NFTio"].exists)
        
//        let categoryNavBar = app.navigationBars["Art"]
//        XCTAssertFalse(categoryCellView.exists)
//        XCTAssert(categoryNavBar.exists)
        //       XCTAssertEqual(app.navigationBars["Art"].staticTexts["Art"].title, "Art")
        
        
        let artButton = elementsQuery.scrollViews.otherElements.buttons["Art"]
        XCTAssert(artButton.exists)
        XCTAssertNotNil(app.navigationBars["Art"].staticTexts["Art"])
                
   
    }

}
