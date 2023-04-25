//
//  PickerModifier.swift
//  NFTio
//
//  Created by Dariy Kutelov on 24.04.23.
//

import SwiftUI

struct PickerModifier: ViewModifier {
    var error: Bool
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: 400.0, minHeight: 50.0)
            .accentColor(Color(Constants.Colors.secondary))
            .background(
                RoundedRectangle(
                    cornerRadius: Constants.General.standardCornerRadius)
                .fill(Color(.white).opacity(0.9))
            )
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.standardCornerRadius)
                    .stroke(error ? Color(.red) :Color(Constants.Colors.secondary), lineWidth: 1.0)
            )
    }
}
