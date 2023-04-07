//
//  User.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.02.23.
//

import Foundation

struct User: Codable {
    var username: String = ""
    var email: String = ""
    var avatarUrl: URL?
    var walletAddress: String?
//    var likedItems: [String] = []
//
//    mutating func toggleNftItemLike(itemId: String) {
//        let itemIndex = likedItems.firstIndex(where: {$0 == itemId })
//
//        if let index = itemIndex {
//            likedItems.remove(at: index)
//        } else {
//            likedItems.append(itemId)
//        }
//    }
//
//    func isItemLiked(itemId: String) -> Bool {
//        likedItems.contains(where: {$0 == itemId })
//    }
}
