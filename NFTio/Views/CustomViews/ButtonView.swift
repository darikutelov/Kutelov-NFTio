//
//  ButtonView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

struct ButtonView: View {
    var buttonText: String
    var buttonTextColor: String = Constants.Colors.buttonText
    var buttonBackgroundColor: String = Constants.Colors.buttonBackground
    
    var body: some View {
        Text("\(buttonText)".uppercased())
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(Color("\(buttonTextColor)").opacity(0.9))
            .padding(
                EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32)
            )
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(Color("\(buttonBackgroundColor)"))
            )
    }
}

struct ButtonIconView: View {
    var buttonText: String
    var buttonTextColor: String = Constants.Colors.buttonText
    var buttonBackgroundColor: String = Constants.Colors.buttonBackground
    var iconName: String = "heart"
    var buttonWidth: CGFloat = .infinity
    
    var body: some View {
        HStack(alignment: .center) {
            if !iconName.isEmpty {
                Image(systemName: iconName)
            }
            
            Text(buttonText.capitalized)
                .fontWeight(.semibold)
        }
        .foregroundColor(Color(buttonTextColor)
            .opacity(0.9))
        .font(.body)
        .padding(
            EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20)
        )
        .frame(maxWidth: buttonWidth)
        .background(
            RoundedRectangle(cornerRadius: 15.0)
                .fill(Color("\(buttonBackgroundColor)"))
        )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(
            buttonText: "Get Started",
            buttonTextColor: Constants.Colors.buttonText,
            buttonBackgroundColor: Constants.Colors.buttonBackground
        )
        ButtonIconView(
            buttonText: "Get Started",
            buttonTextColor: Constants.Colors.buttonText,
            buttonBackgroundColor: Constants.Colors.buttonBackground
        )
    }
}
