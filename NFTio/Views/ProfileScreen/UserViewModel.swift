//
//  UserViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 29.03.23.
//

import Foundation
import SwiftUI

final class UserViewModel: ObservableObject {
    @MainActor @Published var user: User?
    
    private let userDataManager = UserDataManager()
    
    @MainActor @State var isLoading = false

    @MainActor @Published var errorMessage = ""
    
    init() {
        Task {
            await MainActor.run {
                if let currentUser = userDataManager.getUserFromLocalStorage() {
                    self.user = currentUser
                }
            }
        }
    }
    
    @MainActor public func loginUser(email: String, password: String) async {
        isLoading = true
        defer {
            self.isLoading = false
        }
        
        do {
            user = try await userDataManager.loginUser(
                email: email,
                password: password
            )
        } catch let error {
            print(error)
            handleError(error)
        }
    }
    
    @MainActor public func registerUser(username: String,
                                        email: String,
                                        password: String,
                                        rePassword: String) async {
        guard password == rePassword else {
            errorMessage = "Passwords should match!"
            return
        }
        
        isLoading = true
        defer {
            self.isLoading = false
        }
        
        do {
            user = try await userDataManager.registerUser(
                username: username,
                email: email,
                password: password
            )
        } catch let error {
            print(error)
            handleError(error)
        }
    }
    
    @MainActor private func handleError(_ error: Error) {
        if let networkError = error as? APIServiceError {
            switch networkError {
            case .failedToCreateUrl:
                errorMessage = "Error Sending Data"
            case .requestFailed(let message):
                errorMessage = message
            case .responseDecodingFailed(let message):
                errorMessage = message
            case .failedToConnectToServer(let message):
                errorMessage = message
            case .invalidResponse(let message):
                errorMessage = message
            case .objectEncodingFailed:
                errorMessage = "Bad Data from Server"
            }
        } else {
            errorMessage = "Something went wrong!"
        }
    }
    
    @MainActor public func logoutUser() {
         user = nil
         userDataManager.logoutUser()
    }
}
