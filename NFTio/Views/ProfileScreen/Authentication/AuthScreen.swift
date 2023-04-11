//
//  LoginScreen.swift
//  NFTio
//
//  Created by Dariy Kutelov on 29.03.23.
//

import SwiftUI
import Firebase

struct AuthScreen: View {
    @EnvironmentObject var viewModel: UserViewModel
    @State var email: String = "test@test.com"
    @State var password: String = "Test123#"
    @State var rePassword: String = ""
    @State var error: String = ""
    @State var isLogin: Bool = true
    @State var showPassword = false
    @Binding var isPresented: Bool
         
    var body: some View {
        VStack {
            CloseButtonView(isPresented: $isPresented)
            Spacer()
            VStack {
                VStack {
                    Text(isLogin ? "Log In" : "Register")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.top, Constants.Spacing.xxlarge)
                    Spacer()
                        .frame(maxHeight: Constants.Spacing.xxxlarge)
                    
                    TextField("Email", text: $email)
                        .modifier(InputField(error: !error.isEmpty))
                        .padding(.bottom, Constants.Spacing.standard)
                    
                    PasswordField(
                        error: $error,
                        password: $password
                    )
                    
                    if !isLogin {
                        PasswordField(
                            fieldLabel: "Repeate Passord",
                            error: $error,
                            password: $rePassword
                        )
                        .padding(.top, Constants.Spacing.standard)
                    }

                    HStack {
                        if !error.isEmpty {
                            Text("\(error)")
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
                                login()
                            } label: {
                                ButtonIconView(
                                    buttonText: "Sign In",
                                    buttonTextColor: Constants.Colors.white,
                                    buttonBackgroundColor: Constants.Colors.primary,
                                    iconName: "arrow.right.square",
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
                                buttonText: "Register",
                                buttonTextColor: Constants.Colors.white,
                                buttonBackgroundColor: Constants.Colors.terciary,
                                iconName: "square.and.pencil",
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
                                withAnimation {
                                    isLogin = true
                                }
                            } label: {
                                ButtonIconView(
                                    buttonText: "Back To Login",
                                    buttonTextColor: Constants.Colors.white,
                                    buttonBackgroundColor: Constants.Colors.charcoal,
                                    iconName: "arrow.left.square",
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
        UserManager.shared.loginUser(
            email: email,
            password: password) { loginError in
                if let loginError = loginError {
                    error = loginError.localizedDescription
                }
                isPresented = false
            }
    }
    
    private func register() {
        guard password == rePassword else {
            error = "Passwords should match!"
            return
        }
        
        UserManager.shared.registerUser(
            email: email,
            password: password) { registerError in
                if let registerError = registerError {
                    error = registerError.localizedDescription
                }
                isPresented = false
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
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(Color(Constants.Colors.secondary))
                    .font(.title)
                    .padding(.trailing, Constants.Spacing.large)
            }
            
        }
    }
}
