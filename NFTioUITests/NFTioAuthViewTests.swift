//
//  NFTioAuthViewTests.swift
//  NFTioUITests
//
//  Created by Dariy Kutelov on 4.05.23.
//

import XCTest

final class NFTioAuthViewTests: XCTestCase {
    var app: XCUIApplication!
    var authPageScrollView: XCUIElementQuery!
    var tabBar: XCUIElement!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        tabBar = app.tabBars["Tab Bar"]
        sleep(4)
        tabBar.buttons["Home"].tap()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAuthScreenOpen() throws {
        app.buttons["Person"].tap()
        app.buttons["Person"].tap()
        let signInButton = app.buttons["Sign In"]
        let registerButton = app.buttons["Register"]
        let closeButton = app.buttons["Close"]
        
        XCTAssert(signInButton.exists)
        XCTAssert(registerButton.exists)
        XCTAssert(closeButton.exists)
    }
}
