//
//  NFTioProfileScreenViewTests.swift
//  NFTioUITests
//
//  Created by Dariy Kutelov on 4.05.23.
//

import XCTest

final class NFTioProfileScreenViewTests: XCTestCase {
    var app: XCUIApplication!
    var tabBar: XCUIElement!
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        tabBar = app.tabBars["Tab Bar"]
        sleep(4)
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testScreenTitle() throws {
        tabBar.buttons["Home"].tap()
        app.buttons["Person"].tap()
        
        let emailTextField = app.textFields["Email"]
        emailTextField.tap()
        
        app.textFields["Email"].tap()
        emailTextField.typeText("test42@mail.com")
        
        let passwordTextField = app.secureTextFields["Password"]
        passwordTextField.tap()
        passwordTextField.typeText("Test123!")
        
        app.buttons["Sign In"].tap()
        
//        sleep(3)
//        app.tabBars["Tab Bar"].buttons["Profile"].tap()
//        let yourProfileStaticText = app.navigationBars["_TtGC7SwiftUI32NavigationStackHosting"].staticTexts["Your Profile"]
//        XCTAssert(yourProfileStaticText.exists)
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
}
