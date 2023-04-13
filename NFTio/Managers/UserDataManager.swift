//
//  UserDataManager.swift
//  NFTio
//
//  Created by Dariy Kutelov on 13.04.23.
//

import Foundation

final class UserDataManager {
    func loginUser(email: String,
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
            let savedUser = try await APIService.shared.saveData(
                requestUrl,
                bodyData: userCredentials
            )
            
            if var user = savedUser,
               let token = user.authToken {
                user.authToken = token
                Log.general.debug("User: \(user.email) logged in")
                return user
            }
    
        } catch let error {
            throw error
        }
        
        return nil
    }
    
    func registerUser(username: String,
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
            let savedUser = try await APIService.shared.saveData(
                requestUrl,
                bodyData: userCredentials
            )
            
            if var user = savedUser,
               let token = user.authToken {
                user.authToken = token
                Log.general.debug("User: \(user.email) registered")
                return user
            }
    
        } catch let error {
            throw error
        }
        
        return nil
    }
}
