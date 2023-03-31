//
//  ProfileScreenView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import SwiftUI

struct ProfileScreenView: View {
    @EnvironmentObject var viewModel: UserViewModel
    
    var body: some View {
        ZStack {
            if viewModel.currentUser != nil {
                Button {
                    UserManager.shared.logoutUser()
                } label: {
                    ButtonView(buttonText: "Log Out")
                }
            } else {
                LoginScreen()
            }
        }
    }
}

struct ProfileScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreenView()
    }
}
