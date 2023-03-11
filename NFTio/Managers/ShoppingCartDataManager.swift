//
//  ShoppingCartDataManager.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import Foundation

typealias ShoppingCartItem = (nftItem: NFT, quantity: Int)

final class ShoppingCartDataManager {    
    var shoppingCartItems: [ShoppingCartItem] = [
        (nftItem: NFTDataManager().nftItems[0], quantity: 1),
        (nftItem: NFTDataManager().nftItems[1], quantity: 2)
    ]
}
