//
//  User.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.02.23.
//

import Foundation

struct User {
    var isAuthenticated = false
    var username: String = ""
    var email: String = ""
    var avatarUrl: String?
    var walletAddress: String?
}
