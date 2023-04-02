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
                    isLoginScreenOpen = true
                } label: {
                    ButtonView(buttonText: "Log Out")
                        .frame(maxWidth: 300)
                }
                .padding()
            }
            .fullScreenCover(isPresented: $isLoginScreenOpen) {
                AuthScreen(isPresented: $isLoginScreenOpen)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                if viewModel.currentUser == nil {
                    isLoginScreenOpen = viewModel.currentUser == nil
                }
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
