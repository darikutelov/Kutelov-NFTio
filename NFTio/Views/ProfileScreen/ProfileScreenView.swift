//
//  ProfileScreenView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import SwiftUI

struct ProfileScreenView: View {
    @EnvironmentObject var viewModel: UserViewModel
    @State private var isLoginScreenOpen = false
    
    var body: some View {
        ZStack {
            Color(uiColor: .secondarySystemBackground)
            VStack {
                Button {
                    UserManager.shared.logoutUser()
                } label: {
                    ButtonView(buttonText: "Log Out")
                }
                .padding()
            }
            ZStack {
                if isLoginScreenOpen {
                    LoginScreen()
                        .transition(.move(edge: .bottom))
                        .animation(.spring(), value: isLoginScreenOpen)
                }
            }.zIndex(2.0)
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            if viewModel.currentUser == nil {
                isLoginScreenOpen = true
            }
        }
    }
}

struct ProfileScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreenView()
            .environmentObject(UserViewModel())
    }
}
