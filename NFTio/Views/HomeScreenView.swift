//
//  HomeScreenView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 18.02.23.
//

import SwiftUI

struct HomeScreenView: View {
  @Binding var user: User
  @State private var isOnboardingScreenOpen = false
  
    var body: some View {
      ZStack {
        HomeBackgroundView(isOnboardingScreenOpen: $isOnboardingScreenOpen)
        VStack(spacing: Constants.Spacing.large) {
          AppIcon()
            .frame(
              width: Constants.General.appIconSize,
              height: Constants.General.appIconSize
            )
          WelcomeTextView(text: "Welcome, \(user.username)!")
            .padding(Constants.Spacing.xlarge)
        }
      }
    }
}

struct HomeBackgroundView: View {
  @Binding var isOnboardingScreenOpen: Bool
    var body: some View {
      VStack {
        HStack {
          Spacer()
          Button {
            isOnboardingScreenOpen = true
          } label: {
            RoundedImageViewFilled(systemName: "play.fill")
          }
          .padding(.trailing)
          .sheet(isPresented: $isOnboardingScreenOpen) {
            OnboardingScreenView()
          }
        }
        Spacer()
      }
      .padding()
    }
}


struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
      HomeScreenView(user: .constant(User()))
    }
}
