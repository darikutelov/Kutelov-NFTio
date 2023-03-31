//
//  ShoppingCartDataManager.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import Foundation

//typealias ShoppingCartItem = (nftItem: NFT, quantity: Int)

final class ShoppingCartDataManager {    
    var shoppingCartItems: [ShoppingCartItem] = [
        ShoppingCartItem(nftItem: NFTDataManager.shared.nftItems[0], quantity: 1),
        ShoppingCartItem(nftItem: NFTDataManager.shared.nftItems[1], quantity: 2)
    ]
}
