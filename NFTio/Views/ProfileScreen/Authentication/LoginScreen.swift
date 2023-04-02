//
//  LoginScreen.swift
//  NFTio
//
//  Created by Dariy Kutelov on 29.03.23.
//

import SwiftUI
import Firebase

struct LoginScreen: View {
    @EnvironmentObject var viewModel: UserViewModel
    @State var email: String = ""
    @State var password: String = ""
    @State var error: String = ""
    
    //TODO: - SwiftUI Form
    //TODO: - Style Input fields with modifier
    //TODO: - Input validation and error
    //TODO: - Store email and passsword in key chain
    //TODO: - add spinner
    
    
    var body: some View {
        VStack{
            Spacer()
            VStack {
                VStack{
                    Text("Log In")
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                        .padding(.top, Constants.Spacing.large)
                    Spacer()
                        .frame(maxHeight: Constants.Spacing.xxxlarge)

                    TextField("Username", text: $email)
                        .modifier(InputField(error: error != ""))
                    SecureField("Password", text: $password)
                        .modifier(InputField(error: error != ""))
                    if error != "" {
                        Title(text: "\(error)")
                    }
                    Spacer()
                        .frame(maxHeight: Constants.Spacing.xlarge)
                    Button(action: {
                        login()
                    }) {
                        ButtonView(
                            buttonText: "Sign In",
                            buttonTextColor: Constants.Colors.white,
                            buttonBackgroundColor: Constants.Colors.primary
                        )
                        .padding(.bottom, Constants.Spacing.xxxlarge)
                    }
                }.padding()
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
    
    func login() {
        UserManager.shared.loginUser(
            email: email,
            password: password) { loginError in
                if let loginError = loginError {
                    error = loginError.localizedDescription
                }
            }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
