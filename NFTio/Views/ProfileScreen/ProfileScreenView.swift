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
                    viewModel.logoutUser()
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
    }
}

struct ProfileScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreenView()
            .environmentObject(UserViewModel())
    }
}
