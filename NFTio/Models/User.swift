//
//  User.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.02.23.
//

import Foundation

enum Wallet: String, CaseIterable, Codable {
    case metamask = "Metamask"
    case coinbase = "Coinbase Wallet"
    case safepal = "SafePal"
    case exodus = "Exodus"
    case unknown = "Unknown"
}

struct User: Codable {
    var id: String?
    var username: String = ""
    var email: String = ""
    var password: String? = ""
    var avatarUrl: String?
    var walletAddress: String?
    var wallet: Wallet?
    var authToken: String?
}

extension User {
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username, email, password, avatarUrl, walletAddress, authToken
    }
}
