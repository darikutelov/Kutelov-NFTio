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
        VStack(spacing: 24) {
          Image(Constants.imageFileNames.appIcon)
            .resizable()
            .scaledToFill()
            .cornerRadius(12.0)
            .frame(width: 150.0, height: 150.0)
          Text("Welcome, \(user.username)!")
            .font(.title)
            .fontWeight(.semibold)
            .foregroundColor(Color(Constants.colors.primaryText))
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
