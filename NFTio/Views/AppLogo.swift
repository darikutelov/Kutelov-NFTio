//
//  AppLogo.swift
//  NFTio
//
//  Created by Dariy Kutelov on 18.02.23.
//

import SwiftUI

struct AppLogo: View {
    var body: some View {
      VStack(alignment: .center, spacing: 8.0) {
        Image(Constants.imageFileNames.appIcon)
          .resizable()
          .frame(width: 44, height: 44.0)
          .overlay(
            RoundedRectangle(
              cornerRadius: 12.0
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
      .padding()
      .background(
        Color(Constants.colors.primary)
      )
    }
}

struct AppLogo_Previews: PreviewProvider {
    static var previews: some View {
        AppLogo()
    }
}
