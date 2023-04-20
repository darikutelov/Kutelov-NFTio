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
    var password: String? = ""
    var avatarUrl: URL?
    var walletAddress: String?
    var authToken: String?
}
