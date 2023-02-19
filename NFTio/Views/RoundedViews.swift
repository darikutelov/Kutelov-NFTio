//
//  RoundedViews.swift
//  NFTio
//
//  Created by Dariy Kutelov on 18.02.23.
//

import SwiftUI

struct RoundedImageViewFilled: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .font(.caption)
      .foregroundColor(Color(.white))
      .frame(
        width: Constants.General.roundedViewLength,
        height: Constants.General.roundedViewHeight
      )
      .background(
        Circle()
          .fill(Color(Constants.Colors.primary))
      )
  }
}

struct RoundedImageView: View {
  var systemName: String
  
  var body: some View {
    Image(systemName: systemName)
      .foregroundColor(Color(Constants.Colors.primary))
      .font(.title3)
      .padding()
      .background(
        Circle()
          .fill(Color(.white))
      )
  }
}

struct AppIcon: View {
  var body: some View {
    Image(Constants.ImageFileNames.appIcon)
      .resizable()
      .scaledToFill()
      .cornerRadius(Constants.Spacing.standard)
  }
}


struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
      RoundedImageViewFilled(systemName: "play.fill")
      AppIcon()
      RoundedImageView(systemName: "arrow.forward")
    }
}
