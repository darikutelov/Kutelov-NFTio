//
//  DescriptionTextView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 23.02.23.
//

import SwiftUI

struct DescriptionTextView: View {
  var body: some View {
      Text(Constants.Text.Onboarding.description)
      .lineSpacing(Constants.Spacing.small)
      .foregroundColor(Color.white)
      .opacity(0.6)
  }
}

struct DescriptionTextView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionTextView()
    }
}
