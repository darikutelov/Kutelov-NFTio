//
//  NFTUserModelTest.swift
//  NFTioUnitTests
//
//  Created by Dariy Kutelov on 5.05.23.
//

import XCTest
@testable import NFTio

@MainActor
final class NFTUserModelTest: XCTestCase {
    var viewModel: UserViewModel!
    var user: User!
    
    override func setUpWithError() throws {
        viewModel = UserViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testUserInit() throws {
        XCTAssertNil(viewModel.user)
    }

    func testLoginUser() async throws {
        await viewModel.loginUser(email: "test42@mail.com", password: "Test123!")
        
        XCTAssertNotNil(viewModel.user)
    }
    
    func testRegisterUser() async throws {
        await viewModel.registerUser(username: "abc", email: "abc@test.com", password: "Test123!", rePassword: "Test123!")
        
        XCTAssertNotNil(viewModel.user)
    }
    
    func testLoginUser() throws {
        viewModel.logoutUser()
        
        XCTAssertNil(viewModel.user)
    }
}
