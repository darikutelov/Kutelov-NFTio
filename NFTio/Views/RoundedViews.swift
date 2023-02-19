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
          .fill(Color(Constants.colors.primary))
      )
  }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
      RoundedImageViewFilled(systemName: "arrowshape.turn.up.right.fill")
    }
}
