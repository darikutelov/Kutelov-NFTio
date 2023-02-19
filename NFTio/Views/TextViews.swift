//
//  TextViews.swift
//  NFTio
//
//  Created by Dariy Kutelov on 19.02.23.
//

import SwiftUI

struct WelcomeTextView: View {
  let text: String
  
  var body: some View {
    Text(text)
      .font(.title)
      .fontWeight(.semibold)
      .foregroundColor(Color(Constants.Colors.primaryText))
      .multilineTextAlignment(.center)
  }
}

struct DescriptionTextView: View {
  var body: some View {
    Text("Discover, buy, sell, and trade unique digital assets known as non-fungible tokens (NFTs). Browse through various collections of NFTs and view detailed information about each individual NFT.")
      .lineSpacing(Constants.Spacing.small)
      .foregroundColor(Color.white)
      .opacity(0.6)
  }
}

struct ButtonLabelTextView: View {
  let text: String
  
  var body: some View {
    Text(text.uppercased())
      .foregroundColor(.white)
      .font(.body)
      .fontWeight(.semibold)
      .kerning(1.2)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    WelcomeTextView(text: "Welcome")
    DescriptionTextView()
    ButtonLabelTextView(text: "Get started")
  }}
