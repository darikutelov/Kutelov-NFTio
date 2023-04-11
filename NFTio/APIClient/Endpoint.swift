//
//  Endpoint.swift
//  NFTio
//
//  Created by Dariy Kutelov on 8.04.23.
//

import Foundation

/// Represents unique API endpoints
@frozen enum Endpoint: String {
    /// End point to get all nft items, details about nft item, create a nft item
    case nftItems = "nft-items"
    /// End point to get all categories
    case categories
    /// End point to get all collections
    case collections
    /// End point to create or get user data
    case users
    /// End point to create or get user orders
    case orders
}
