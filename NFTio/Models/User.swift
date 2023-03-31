//
//  User.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.02.23.
//

import Foundation

struct User: Decodable {
    var username: String = ""
    var email: String = ""
    var avatarUrl: URL?
    var walletAddress: String?
}
