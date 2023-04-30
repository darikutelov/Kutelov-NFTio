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
        NavigationStack {
            ZStack {
                Color(uiColor: .secondarySystemBackground)
                VStack {
                    Spacer()
                        .frame(height: Constants.Spacing.superLarge)
                    Form {
                        Section {
                            HStack {
                                Spacer()
                                UserAvatarView(viewModel: viewModel)
                                Spacer()
                            }
                        }
                        .listRowBackground(Color.clear)
                        #if !os(macOS)
                        .padding([.top], 10)
                        #endif
                        
                        
                        
                        Button {
                            viewModel.logoutUser()
                            isLoginScreenOpen = true
                        } label: {
                            ButtonView(buttonText: Constants.Text.Auth.logout)
                                .frame(maxWidth: Constants.Spacing.maxWidth)
                        }
                        .padding()
                        .listRowBackground(Color.clear)
                    }
                    .background(Color.clear)
                }
                .fullScreenCover(isPresented: $isLoginScreenOpen) {
                    AuthScreen(isPresented: $isLoginScreenOpen)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Spacer()
                        Text(Constants.Text.Auth.title)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(Constants.Colors.secondary))
                        Spacer()
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ProfileScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreenView()
            .environmentObject(UserViewModel())
    }
}
