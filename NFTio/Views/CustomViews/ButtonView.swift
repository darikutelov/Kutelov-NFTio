//
//  ButtonView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

struct ButtonView: View {
    var buttonText: String
    
    var body: some View {
        Text("\(buttonText)".uppercased())
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(Color(Constants.Colors.buttonText))
            .padding(
                EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32)
            )
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(Color(Constants.Colors.buttonBackground))
            )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(buttonText: "Get Started")
    }
}
