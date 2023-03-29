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
        }
        .padding()
    }
    
    func login() {
          Auth
            .auth()
            .signIn(withEmail: email, password: password) { result, error in
              if error != nil {
                  print(error?.localizedDescription ?? "")
              } else {
                  email = ""
                  password = ""
//                  Log.info.debug(result?.user)
                  if let user = Auth.auth().currentUser {
                      print(user.email)
                  }
              }
          }
      }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
