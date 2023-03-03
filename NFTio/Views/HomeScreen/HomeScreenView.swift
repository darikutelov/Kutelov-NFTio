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
        NavigationView {
            ZStack {
                HomeBackgroundView(isOnboardingScreenOpen: $isOnboardingScreenOpen)
                VStack(spacing: Constants.Spacing.large) {
                    Spacer()
                    AppIconView()
                        .frame(
                            width: Constants.General.appIconSize,
                            height: Constants.General.appIconSize
                        )
                    WelcomeTextView(text: "\(Constants.Text.Home.welcome), \(user.username)!")
                        .padding(Constants.Spacing.xlarge)
                    Spacer()
                    NavigationLink(destination: NFTListingView().navigationBarBackButtonHidden(true)
                        .navigationTitle("All NFTs")
                        , label: {
                        ButtonView(buttonText: "Get Started")
                            .padding([.bottom])
                    })
                    .navigationBarTitleDisplayMode(.large)
                    .padding([.bottom])
                    
                }.background(
                    HomeBackgroundImageView()
                )
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
                    RoundedIconViewFilled(systemName: "play.fill")
                }
                .padding([.trailing, .top])
                .sheet(isPresented: $isOnboardingScreenOpen) {
                    OnboardingScreenView(
                        isOnboardingScreenOpen: $isOnboardingScreenOpen
                    )
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
