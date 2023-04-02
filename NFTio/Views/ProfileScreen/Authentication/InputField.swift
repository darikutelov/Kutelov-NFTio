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
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .foregroundColor(Color(Constants.Colors.secondary))
        .padding(.bottom, Constants.Spacing.small)
    }
}
