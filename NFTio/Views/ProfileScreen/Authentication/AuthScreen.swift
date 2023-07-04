//
//  LoginScreen.swift
//  NFTio
//
//  Created by Dariy Kutelov on 29.03.23.
//

import SwiftUI

struct AuthScreen: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var rePassword: String = ""
    @State var isLogin: Bool = true
    @State var showPassword = false
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            CloseButtonView(isPresented: $isPresented)
            Spacer()
            if userViewModel.isLoading {
                ProgressView()
            }
            VStack {
                VStack {
                    Text(isLogin ?
                            Constants.Text.Auth.signIn :
                            Constants.Text.Auth.register)
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.top, Constants.Spacing.xxlarge)
                    Spacer()
                        .frame(maxHeight: Constants.Spacing.xxxlarge)
                    
                    TextField(Constants.Text.Auth.emailFieldLabel,
                              text: $email)
                        .modifier(InputField(error: !userViewModel.errorMessage.isEmpty))
                        .padding(.bottom, Constants.Spacing.standard)
                    
                    if !isLogin {
                        TextField(Constants.Text.Auth.usernameFieldLabel,
                                  text: $username)
                            .modifier(InputField(error: !userViewModel.errorMessage.isEmpty))
                            .padding(.bottom, Constants.Spacing.standard)
                    }
                    
                    PasswordField(
                        error: $userViewModel.errorMessage,
                        password: $password
                    )
                    
                    if !isLogin {
                        PasswordField(
                            fieldLabel: Constants.Text.Auth.rePasswordFieldLabel,
                            error: $userViewModel.errorMessage,
                            password: $rePassword
                        )
                        .padding(.top, Constants.Spacing.standard)
                    }
                    
                    HStack {
                        if !userViewModel.errorMessage.isEmpty {
                            Text("\(userViewModel.errorMessage)")
                                .font(.callout)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color(.red))
                                .frame(maxWidth: 300.0)
                        }
                    }.frame(
                        height: Constants.Spacing.xxlarge
                    )
                    
                    if isLogin {
                        HStack {
                            Spacer()
                            Button {
                                userViewModel.errorMessage = ""
                                login()
                            } label: {
                                ButtonIconView(
                                    buttonText: userViewModel.isLoading ?
                                        Constants.Text.General.loading :
                                        Constants.Text.Auth.signIn,
                                    buttonTextColor: Constants.Colors.white,
                                    buttonBackgroundColor: Constants.Colors.primary,
                                    iconName: Constants.Text.Auth.signInIcon,
                                    buttonWidth: 300.0
                                )
                            }
                            Spacer()
                        }
                        .padding(.bottom, Constants.Spacing.xsmall)
                    }
                    HStack {
                        Spacer()
                        Button {
                            userViewModel.errorMessage = ""
                            if isLogin == true {
                                email = ""
                                password = ""
                                withAnimation {
                                    isLogin = false
                                }
                            } else {
                                guard !email.isEmpty, !password.isEmpty, !rePassword.isEmpty else {
                                    return
                                }
                                register()
                            }
                            
                        } label: {
                            ButtonIconView(
                                buttonText: userViewModel.isLoading ?
                                    Constants.Text.General.loading :
                                    Constants.Text.Auth.register,
                                buttonTextColor: Constants.Colors.white,
                                buttonBackgroundColor: Constants.Colors.terciary,
                                iconName: Constants.Text.Auth.registerIcon,
                                buttonWidth: 300.0
                            )
                        }
                        Spacer()
                    }
                    .padding(.bottom, Constants.Spacing.medium)
                    if !isLogin {
                        HStack {
                            Spacer()
                            Button {
                                email = ""
                                username = ""
                                password = ""
                                rePassword = ""
                                withAnimation {
                                    userViewModel.errorMessage = ""
                                    isLogin = true
                                }
                            } label: {
                                ButtonIconView(
                                    buttonText: Constants.Text.Auth.backToSignIn,
                                    buttonTextColor: Constants.Colors.white,
                                    buttonBackgroundColor: Constants.Colors.charcoal,
                                    iconName: Constants.Text.Auth.backToSignInIcon,
                                    buttonWidth: 300.0
                                )
                            }
                            Spacer()
                        }
                        .padding(.bottom, Constants.Spacing.xsmall)
                    }
                }
            }
            .background {
                Rectangle()
                    .fill(
                        Color(Constants.Colors.secondary)
                    )
                    .cornerRadius(Constants.General.roundedRectCornerRadius)
                    .padding(.bottom, -Constants.Spacing.xxlarge)
                    .ignoresSafeArea(.all)
            }
            
        }
        .background(
            Image(Constants.ImageFileNames.authBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
        )
        
    }
    
    private func login() {
        Task {@MainActor in
            await userViewModel.loginUser(
                email: email,
                password: password
            )
            
            if userViewModel.user != nil {
                isPresented = false
            }
        }
    }
    
    private func register() {        
        Task {@MainActor in
            await userViewModel.registerUser(
                username: username,
                email: email,
                password: password,
                rePassword: rePassword
            )
            
            if userViewModel.user != nil {
                isPresented = false
            }
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        AuthScreen(isPresented: .constant(true))
    }
}

struct CloseButtonView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                isPresented = false
            } label: {
                Image(systemName: Constants.Text.Auth.closeIcon)
                    .foregroundColor(Color(Constants.Colors.secondary))
                    .font(.title)
                    .padding(.trailing, Constants.Spacing.large)
            }
            
        }
    }
}
