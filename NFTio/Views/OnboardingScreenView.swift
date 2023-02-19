//
//  OnboardingScreenView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 18.02.23.
//

import SwiftUI

struct OnboardingScreenView: View {
  var body: some View {
    ZStack(alignment: .top) {
      Image(Constants.imageFileNames.onboardingBackground)
        .resizable()
        .aspectRatio(contentMode: .fit)
      OnboardingMessageView()
    }
    .edgesIgnoringSafeArea(.all)
  }
}


struct OnboardingMessageView: View {
  @Environment(\.dismiss) var dismiss

  var body: some View {
    VStack {
      Spacer()
      VStack {
        AppLogo()
          .padding(.top, 24.0)
        Text("Discover, buy, sell, and trade unique digital assets known as non-fungible tokens (NFTs). Browse through various collections of NFTs and view detailed information about each individual NFT")
          .lineSpacing(5.0)
          .foregroundColor(Color.white)
          .opacity(0.6)
          .padding(.horizontal, 24.0)
        
        Button {
          dismiss()
        } label: {
          GetStartedButton()
        }
        .padding(.vertical, 24.0)
      }
      .background {
        RoundedRectangle(
          cornerRadius: Constants.General.roundedRectCornerRadius
        )
        .fill(
          Color(Constants.colors.primary)
        )
      }
    }
    .padding(-0.1)
  }
}

struct GetStartedButton: View {
  var body: some View {
    HStack {
      Image(systemName: "arrow.forward")
        .foregroundColor(Color(Constants.colors.primary))
        .font(.title3)
        .padding()
        .background(
          Circle()
            .fill(Color(.white))
        )
      Spacer()
      Text("Get Started".uppercased())
        .foregroundColor(.white)
        .font(.body)
        .fontWeight(.semibold)
        .kerning(1.2)
      Spacer()
    }
    .frame(width: 270, height: 64)
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(RadialGradient(
          gradient: Gradient(
            colors: Constants.colors.buttonBorderGradientColors),
          center: .leading,
          startRadius: 1,
          endRadius: 327), lineWidth: 2)
        .background(
          RoundedRectangle(cornerRadius: .infinity)
            .fill(
              RadialGradient(
                gradient: Gradient(
                  colors: Constants.colors.buttonBackgroundGradientColors),
                center: .leading,
                startRadius: 1,
                endRadius: 327)
            )
        )
        .frame(width: 280, height: 64)
    )
    .padding(.bottom, 24.0)
  }
}

struct OnboardingScreenView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingScreenView()
  }
}
