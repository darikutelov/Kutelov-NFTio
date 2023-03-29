//
//  UserManager.swift
//  NFTio
//
//  Created by Dariy Kutelov on 29.03.23.
//

import Foundation
import Firebase

class UserManager {
    static let shared = UserManager()
    let auth = Auth.auth()
    
    private init() {}
    
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
