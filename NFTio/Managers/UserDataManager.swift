//
//  UserDataManager.swift
//  NFTio
//
//  Created by Dariy Kutelov on 13.04.23.
//

import Foundation
import SwiftUI

final class UserDataManager {
    @AppStorage(Constants.Api.currentUser) private var currerntUser: Data?
    
    public func loginUser(email: String,
                          password: String) async throws -> User? {
        let userCredentials = User(
            email: email,
            password: password
        )
        
        do {
            let requestUrl = RequestUrl(
                endpoint: .users,
                pathComponents: ["login"]
            )
            let savedUser = try await APIService.shared.postData(
                requestUrl,
                bodyData: userCredentials
            )
            
            if var user = savedUser,
               let token = user.authToken {
                user.authToken = token
                saveUserToLocalStorage(user)
                Log.general.debug("User: \(user.email) logged in")
                return user
            }
            
        } catch let error {
            throw error
        }
        
        return nil
    }
    
    public func registerUser(username: String,
                             email: String,
                             password: String) async throws -> User? {
        let userCredentials = User(
            username: username,
            email: email,
            password: password
        )
        
        do {
            let requestUrl = RequestUrl(
                endpoint: .users,
                pathComponents: ["register"]
            )
            let savedUser = try await APIService.shared.postData(
                requestUrl,
                bodyData: userCredentials
            )
            
            if var user = savedUser,
               let token = user.authToken {
                user.authToken = token
                saveUserToLocalStorage(user)
                Log.general.debug("User: \(user.email) registered")
                return user
            }
            
        } catch let error {
            throw error
        }
        
        return nil
    }
    
    public func logoutUser() {
        currerntUser = nil
    }
    
    public func updateUser(user: User) async throws {
        do {
            let requestUrl = RequestUrl(
                endpoint: .users,
                pathComponents: ["update"]
            )
            let _ = try await APIService.shared.postData(
                requestUrl,
                bodyData: user
            )
            
            saveUserToLocalStorage(user)
            Log.general.debug("User: \(user.email) updated!")

        } catch let error {
            throw error
        }
    }
    
    // MARK: - Persist user data to local storage
    
    private func saveUserToLocalStorage(_ user: User) {
        let encoder = JSONEncoder()
        if let encodedUser = try? encoder.encode(user) {
            currerntUser = encodedUser
        }
    }
    
    public func getUserFromLocalStorage() -> User? {
        let decoder = JSONDecoder()
        if let user = currerntUser,
           let decodedUser = try? decoder.decode(User.self, from: user) {
            APIService.authToken = decodedUser.authToken
            return decodedUser
        }
        
        return nil
    }
}
