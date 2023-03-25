//
//  CartViewModelTests.swift
//  NFTioTests
//
//  Created by Dariy Kutelov on 23.03.23.
//

import XCTest

@testable import NFTio

final class CartViewModelTests: XCTestCase {
    var cartItem1: ShoppingCartItem!
    var cartItem2: ShoppingCartItem!

    override func setUpWithError() throws {
        cartItem1 = ShoppingCartDataManager().shoppingCartItems[0]
        cartItem2 = ShoppingCartDataManager().shoppingCartItems[1]
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAddToCartNewNFTItem() {
        
    }
    
    func testAddToCartExistingNFTItem() {
        
    }
    
    func testTotalAmount() {
        
    }
}
