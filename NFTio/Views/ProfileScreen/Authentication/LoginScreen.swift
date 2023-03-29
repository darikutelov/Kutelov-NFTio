//
//  LoginScreen.swift
//  NFTio
//
//  Created by Dariy Kutelov on 29.03.23.
//

import SwiftUI
import Firebase

struct LoginScreen: View {
    @State var email: String = "dari.k@abv.bg"
    @State var password: String = "Andi1d2k9@"
    @State var error: String = ""
    
    //TODO: - SwiftUI Form
    //TODO: - Style Input fields with modifier
    //TODO: - Input validation and error
    //TODO: - Firebase Auth
    //TODO: - Store email and passsword in key chain
    
    
    var body: some View {
        VStack {
            Title(text: "Log In")
            TextField("Username", text: $email)
            SecureField("Password", text: $password)
            Button(action: { login() }) {
                Text("Sign in")
            }
            
            if error != "" {
                Title(text: "\(error)")
            }
        }
        .padding()
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
