//
//  TextFieldModifier.swift
//  NFTio
//
//  Created by Dariy Kutelov on 1.04.23.
//

import SwiftUI

struct InputField: ViewModifier {
    var error: Bool
    
    func body(content: Content) -> some View {
        content
            .padding()
            .foregroundColor(Color(Constants.Colors.secondary))
            .frame(height: 50.0)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color(.white))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(error ? Color(.red) : Color(.clear), lineWidth: 2.0)
            )
            .frame(maxWidth: 300)
    }
}

struct StandardInputField: ViewModifier {
    var error: Bool
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(error ? Color(.red) : Color(Constants.Colors.primaryText))
    }
}
