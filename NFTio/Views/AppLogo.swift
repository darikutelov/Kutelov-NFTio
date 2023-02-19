//
//  AppLogo.swift
//  NFTio
//
//  Created by Dariy Kutelov on 18.02.23.
//

import SwiftUI

struct AppLogo: View {
    var body: some View {
      HStack(alignment: .center, spacing: Constants.Spacing.small) {
        AppIcon()
          .frame(
            width: Constants.Spacing.xxlarge,
            height: Constants.Spacing.xxlarge)
          .overlay(
            RoundedRectangle(
              cornerRadius: Constants.Spacing.small
            )
              .strokeBorder(
                Color(.white),
                lineWidth: Constants.General.strokeWidth
              )
          )

        Text("NFTio")
          .font(.title)
          .foregroundColor(.white)
          .fontWeight(.semibold)
          .kerning(1.2)
      }
      .background(
        Color(Constants.Colors.primary)
      )
    }
}

struct AppLogo_Previews: PreviewProvider {
    static var previews: some View {
        AppLogo()
    }
}
