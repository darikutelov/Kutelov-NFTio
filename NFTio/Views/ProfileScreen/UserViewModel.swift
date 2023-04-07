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
    @Published var currentUser: User?
    
    init() {
       updateUserState()
    }
    
    private func updateUserState() {
        UserManager.shared.updateCurrentUser { [weak self] user in
            self?.currentUser = user
        }
    }
}
