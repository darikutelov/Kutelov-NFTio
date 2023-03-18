//
//  CartViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import Foundation

final class CartViewModel: ObservableObject {
    @Published var cartItems: [ShoppingCartItem] = []
    
    var cartItemIds: [String] {
        cartItems.map{ $0.nftItem.id }
    }
        
    public func addItemToCart(nft: NFT) {
        guard let itemIndex = findCartItemIndex(nft.id) else {
            cartItems.append(
                ShoppingCartItem(
                    nftItem: nft,
                    quantity: 1
                )
            )
            return
        }
        
        cartItems[itemIndex].quantity += 1
    }
    
    public func removeItemFromCart(shoppingCardItem: ShoppingCartItem) {
        guard let itemIndex = findCartItemIndex(shoppingCardItem.nftItem.id) else {
            return
        }
    
        cartItems.remove(at: itemIndex)
    }
    
    public func reduceItemQuantityInCart(shoppingCardItem: ShoppingCartItem) {
        guard let itemIndex = findCartItemIndex(shoppingCardItem.nftItem.id) else {
            return
        }
    
        guard cartItems[itemIndex].quantity > 0 else {
            return
        }
        
        cartItems[itemIndex].quantity -= 1
    }
    
    private func findCartItemIndex(_ nftId: String) -> Int? {
        if let itemIndex = cartItems.firstIndex(where: { $0.nftItem.id == nftId}) {
            return itemIndex
        }
        return nil
    }
}
