//
//  ShoppingCartItem.swift
//  NFTio
//
//  Created by Dariy Kutelov on 18.03.23.
//

import Foundation

struct ShoppingCartItem: Codable {
    let nftItem: NFT
    var quantity: UInt
}
