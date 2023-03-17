//
//  CartViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import Foundation

final class CartViewModel: ObservableObject {
    @Published var cartItems: [NFT] = []
}
