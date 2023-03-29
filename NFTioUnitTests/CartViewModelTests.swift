//
//  CartViewModelTests.swift
//  NFTioTests
//
//  Created by Dariy Kutelov on 23.03.23.
//

import XCTest

@testable import NFTio

final class CartViewModelTests: XCTestCase {
    var viewModel: CartViewModel!
    var cartItem1: ShoppingCartItem!
    var cartItem2: ShoppingCartItem!

    override func setUpWithError() throws {
        viewModel = CartViewModel()
        viewModel.cartItems = []
        cartItem1 = ShoppingCartDataManager().shoppingCartItems[0]
        cartItem2 = ShoppingCartDataManager().shoppingCartItems[1]
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testItemsInCart() {
        viewModel.cartItems = [cartItem1, cartItem2]
        
        XCTAssertEqual(viewModel.cartItems.count, 2)
        XCTAssert(viewModel.cartItems[0].quantity > 0)
        XCTAssert(viewModel.cartItems[1].quantity > 0)
        XCTAssertNotNil(viewModel.cartItems[0].nftItem)
        XCTAssertNotNil(viewModel.cartItems[1].nftItem)
    }

    func testAddNewItemToCart() {
        XCTAssertEqual(viewModel.cartItems.count, 0)
        
        viewModel.addItemToCart(nft: cartItem1.nftItem)
        XCTAssertEqual(viewModel.cartItems.count, 1)
        XCTAssertEqual(viewModel.cartItems[0].quantity, 1)
        
        viewModel.addItemToCart(nft: cartItem2.nftItem)
        XCTAssertEqual(viewModel.cartItems.count, 2)
        XCTAssertEqual(viewModel.cartItems[1].quantity, 1)
    }
    
    func testAddExistingItemInCart() {
        XCTAssertEqual(viewModel.cartItems.count, 0)
        
        viewModel.addItemToCart(nft: cartItem1.nftItem)
        XCTAssertEqual(viewModel.cartItems.count, 1)
        XCTAssertEqual(viewModel.cartItems[0].quantity, 1)
        
        viewModel.addItemToCart(nft: cartItem1.nftItem)
        XCTAssertEqual(viewModel.cartItems.count, 1)
        XCTAssertEqual(viewModel.cartItems[0].quantity, 2)
    }
    
    func removeItemFromCart() {
        viewModel.addItemToCart(nft: cartItem1.nftItem)
        viewModel.addItemToCart(nft: cartItem2.nftItem)
        XCTAssertEqual(viewModel.cartItems.count, 2)
     
        viewModel.removeItemFromCart(shoppingCardItem: cartItem1)
        XCTAssertEqual(viewModel.cartItems.count, 2)
    }
    
    func testTotalAmount() {
        XCTAssertEqual(viewModel.totalAmount, 0)
        
        viewModel.addItemToCart(nft: cartItem1.nftItem)
        var totalAmount = viewModel.totalAmount.rounded(2, .bankers)
        XCTAssertEqual(totalAmount, 67.45)
        
        viewModel.addItemToCart(nft: cartItem2.nftItem)
        totalAmount = viewModel.totalAmount.rounded(2, .bankers)
        XCTAssertEqual(totalAmount, 134.85)
    
    }
    
    func testReduceItemQuantityInCart() {
        viewModel.addItemToCart(nft: cartItem1.nftItem)
        viewModel.addItemToCart(nft: cartItem1.nftItem)
        XCTAssertEqual(viewModel.cartItems[0].quantity, 2)
        
        viewModel.reduceItemQuantityInCart(shoppingCardItem: cartItem1)
        XCTAssertEqual(viewModel.cartItems[0].quantity, 1)
    }
    
    func testTotalAmountAfterSeasonalDiscount() throws {
        viewModel.addItemToCart(nft: cartItem1.nftItem)
        viewModel.addItemToCart(nft: cartItem2.nftItem)
        XCTAssertNotNil(viewModel.seasonalDiscount)
        
        let totalAmountAfterDiscount = try XCTUnwrap(
            viewModel.totalAmountAfterDiscount
        )
        
        let roundedAmount = ((NSDecimalNumber(decimal: totalAmountAfterDiscount).doubleValue * 100).rounded())/100
        
        XCTAssertEqual(roundedAmount, 128.11)
    }
    
    func testTotalAmountAfterApplyingPromoCode() throws {
        viewModel.addItemToCart(nft: cartItem1.nftItem)
        viewModel.addItemToCart(nft: cartItem2.nftItem)
        
        viewModel.applyPromoCode("123")
        
        let promoCode = try XCTUnwrap(viewModel.promoCodeDiscount)
        let totalAmountAfterDiscount = promoCode.calculateDiscount(totalAmount: viewModel.totalAmount)
        
        let roundedAmount = ((NSDecimalNumber(decimal: totalAmountAfterDiscount).doubleValue * 100).rounded())/100
        
        XCTAssertEqual(roundedAmount, 114.63)
    }
}
