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
    
    private init() {}
    
    func updateCurrentUser(completion: @escaping((_ user: User?) -> Void)) {
        Auth
            .auth()
            .addStateDidChangeListener({ auth, user in
                if let user = user {
                    let currentUser = User(
                        username: user.displayName ?? "Buddy",
                        email: user.email ?? "",
                        avatarUrl: user.photoURL
                    )
                    completion(currentUser)
                }
                else {         
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
                
                completion(nil)
            }
    }
    
    func logoutUser() {
        do {
            try auth
                .signOut()
        } catch {
            debugPrint(error.localizedDescription)
        }
    }
}