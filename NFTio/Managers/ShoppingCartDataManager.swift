//
//  ShoppingCartDataManager.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

final class ShoppingCartDataManager {
    @AppStorage(Constants.Api.currentCart) private var currentCart: Data?
    
    var shoppingCartItems: [ShoppingCartItem] = [] {
        didSet {
            saveCartToLocalStorage(shoppingCartItems)
        }
    }
    
    init() {
        if let cartItems = getCartFromLocalStorage() {
            shoppingCartItems = cartItems
        }
    }
    
    private func saveCartToLocalStorage(_ cartItems: [ShoppingCartItem]) {
        let encoder = JSONEncoder()
        if let encodedCart = try? encoder.encode(cartItems) {
            currentCart = encodedCart
        }
    }
    
    public func getCartFromLocalStorage() -> [ShoppingCartItem]? {
        let decoder = JSONDecoder()
        if let cart = currentCart,
           let decodedCart = try? decoder.decode([ShoppingCartItem].self, from: cart) {
            return decodedCart
        }
        return nil
    }
}
