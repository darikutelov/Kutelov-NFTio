//
//  UserViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 29.03.23.
//

import Foundation


import SwiftUI
import Firebase


final class UserViewModel: ObservableObject {
    @Published var currentUser: User? = nil
    
    init() {
        setAuthListener()
    }
    
    private func setAuthListener() {
        Auth
            .auth()
            .addStateDidChangeListener({ auth, user in
                if let user = user{
                    self.currentUser = User(
                        isAuthenticated: true,
                        username: user.displayName ?? "Buddy",
                        email: user.email ?? "",
                        avatarUrl: user.photoURL
                    )
                }
                else {
                    self.currentUser = nil
                }
            })
    }
}

