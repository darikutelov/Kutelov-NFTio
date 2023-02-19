//
//  ButtonViews.swift
//  NFTio
//
//  Created by Dariy Kutelov on 19.02.23.
//

import SwiftUI

struct GetStartedButton: View {
  var body: some View {
    HStack {
      RoundedImageView(systemName: "arrow.forward")
      Spacer()
      ButtonLabelTextView(text: "Get Started")
      Spacer()
    }
    .frame(
      width: Constants.General.roundedRectViewWidth,
      height: Constants.Spacing.xxxlarge)
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(RadialGradient(
          gradient: Gradient(
            colors: Constants.Colors.buttonBorderGradientColors),
            center: .leading,
            startRadius: Constants.Spacing.small,
          endRadius: Constants.General.roundedRectViewWidth),
          lineWidth: Constants.General.strokeWidth)
        .background(
          RoundedRectangle(cornerRadius: .infinity)
            .fill(
              RadialGradient(
                gradient: Gradient(
                  colors: Constants.Colors.buttonBackgroundGradientColors),
                  center: .leading,
                  startRadius: Constants.Spacing.small,
                endRadius: Constants.General.roundedRectViewWidth)
            )
        )
        .frame(width: Constants.General.roundedRectViewWidth + Constants.Spacing.standard, height: Constants.Spacing.xxxlarge)
    )
  }
}

struct ButtonViews_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        Color(Constants.Colors.primary)
        GetStartedButton()
      }
    }
}
