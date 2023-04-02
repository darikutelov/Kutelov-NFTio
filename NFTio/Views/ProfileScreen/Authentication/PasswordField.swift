//
//  RegisterView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 2.04.23.
//

import SwiftUI

struct PasswordField: View {
    var fieldLabel = "Password"
    @Binding var error: String
    @Binding var password: String
    @State var showPassword = false
    
    var body: some View {
        ZStack(alignment: .center) {
            Group {
                if showPassword {
                    TextField(fieldLabel, text: $password)
                    
                } else {
                    SecureField(fieldLabel, text: $password)
                }
            }.modifier(InputField(error: error != ""))
            
            HStack {
                Spacer()
                Button {
                    showPassword.toggle()
                } label: {
                    if showPassword {
                        Image(systemName: "eye.slash")
                            .foregroundColor(Color(Constants.Colors.secondary))
                    } else {
                        Image(systemName: "eye")
                            
                            .foregroundColor(Color(Constants.Colors.secondary))
                    }
                }
                .padding(.trailing, 6.0)
            }.frame(maxWidth: 300)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordField(error: .constant(""),password: .constant("myPassword"))
    }
}
