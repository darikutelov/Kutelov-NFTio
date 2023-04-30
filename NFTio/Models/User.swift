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
    case unknown = "N/A"
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
    
    struct InfoField: Identifiable {
        let id = UUID()
        let label: String
        let text: String
    }

    func createInfoFieldsArray() -> [InfoField] {
        return [
            InfoField(label: "Username", text: self.username),
            InfoField(label: "Email", text: self.email),
            InfoField(label: "Wallet", text: self.wallet?.rawValue ?? Wallet.unknown.rawValue),
            InfoField(label: "Wallet Address", text: self.walletAddress ?? "N/A")
        ]
    }
}

extension User {
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username, email, password, avatarUrl, walletAddress, authToken
    }
}
