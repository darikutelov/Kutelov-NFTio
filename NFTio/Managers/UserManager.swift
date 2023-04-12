//
//  UserManager.swift
//  NFTio
//
//  Created by Dariy Kutelov on 29.03.23.
//

import Foundation
import Firebase

final class UserManager: ObservableObject {
    let auth = Auth.auth()
    
    static var shared = UserManager()
    static var authToken: String?
    
    private init() {}
    
    func updateCurrentUser(completion: @escaping((_ user: User?) -> Void)) {
        Auth
            .auth()
            .addStateDidChangeListener({ _, user in
                if let user = user {
                    var currentUser = User(
                        username: user.displayName ?? "Anonymous",
                        email: user.email ?? "",
                        avatarUrl: user.photoURL
                    )
                    
                    if let authToken = Self.authToken {
                        currentUser.authToken = authToken
                    }
                    
                    completion(currentUser)
                } else {
                    completion(nil)
                }
            })
    }
    
    func registerUser(email: String,
                      password: String,
                      completion: @escaping (_ error: Error?) -> Void) {
        
        auth
            .createUser(withEmail: email,
                        password: password) { authResult, error in
                
                guard error == nil else {
                    completion(error)
                    return
                }
                
                if let currentUser = authResult?.user {
                    let user = User(
                        uid: currentUser.uid,
                        email: email,
                        password: password
                    )
                    
                    Task {
                        do {
                            let requestUrl = RequestUrl(endpoint: .users, pathComponents: ["register"])
                            let savedUser = try await APIService.shared.saveData(
                                requestUrl,
                                bodyData: user,
                                authToken: nil
                            )
                            
                            if let user = savedUser,
                               let token = user.authToken
                            {
                                Self.authToken = token
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
                
                completion(nil)
            }
    }
    
    func loginUser(email: String,
                   password: String,
                   completion: @escaping (_ error: Error?) -> Void) {
        
        auth
            .signIn(withEmail: email,
                    password: password) { authResult, error in
                
                guard error == nil else {
                    completion(error)
                    return
                }
                
                Log.general.debug("User logged in")
                
                if let currentUser = authResult?.user {
                    let user = User(
                        uid: currentUser.uid,
                        email: email,
                        password: password
                    )
                    
                    Task {
                        do {
                            let requestUrl = RequestUrl(endpoint: .users, pathComponents: ["login"])
                            let savedUser = try await APIService.shared.saveData(
                                requestUrl,
                                bodyData: user,
                                authToken: nil
                            )
                            
                            print(String(describing: savedUser))
                        } catch {
                            print(error)
                        }
                    }
                }
                
                completion(nil)
            }
    }
    
    func logoutUser() {
        do {
            try auth.signOut()
            Log.general.debug("User logged out")
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}
