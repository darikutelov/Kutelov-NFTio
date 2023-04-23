//
//  User.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.02.23.
//

import Foundation

struct User: Codable {
    var id: String?
    var username: String = ""
    var email: String = ""
    var password: String? = ""
    var avatarUrl: URL?
    var walletAddress: String?
    var authToken: String?
}

extension User {
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username, email, password, avatarUrl, walletAddress, authToken
    }
}
