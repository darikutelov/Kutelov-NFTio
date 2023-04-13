//
//  UserViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 29.03.23.
//

import Foundation

import SwiftUI

final class UserViewModel: ObservableObject {
    @Published var user: User? {
        didSet {
            print(String(describing: user))
        }
    }
    private let userDataManager = UserDataManager()
    @State var isLoading = false
    /// Error flag
    @MainActor @Published var showErrorAlert = false
    /// Error Message
    @MainActor @Published var errorMessage = ""
    
    public func loginUser(email: String, password: String) async {
        do {
            user = try await userDataManager.loginUser(
                email: email,
                password: password
            )
        } catch let error {
            print(error)
        }
    }
    
    public func registerUser(username: String,
                             email: String,
                             password: String) async {
        do {
            user = try await userDataManager.registerUser(
                username: username,
                email: email,
                password: password
            )
        } catch let error {
            print(error)
        }
    }
    
    public func logoutUser() {
        user = nil
    }
}
