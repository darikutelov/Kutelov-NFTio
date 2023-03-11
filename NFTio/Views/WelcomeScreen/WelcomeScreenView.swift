//
//  HomeScreenView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 18.02.23.
//

import SwiftUI

struct WelcomeScreenView: View {
    @Binding var user: User
    @State private var isOnboardingScreenOpen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                HomeBackgroundView(isOnboardingScreenOpen: $isOnboardingScreenOpen)
                VStack() {
                    Spacer()
                    AppIconView()
                        .frame(
                            width: Constants.General.appIconSize,
                            height: Constants.General.appIconSize
                        )
                        .padding(.top, Constants.Spacing.xlarge)
                    WelcomeTextView(text: "\(Constants.Text.Home.welcome), \(user.username)!")
                        .padding(Constants.Spacing.xlarge)
                    Spacer()
                    NavigationLink(
                        destination: HomeView().navigationBarBackButtonHidden(true)
                        , label: {
                        ButtonView(buttonText: "Get Started")
                            .padding()
                            .frame(maxWidth: 400)
                    })
                    .navigationBarTitleDisplayMode(.large)
                    .padding(.bottom)
                    
                }.background(
                    WelcomeBackgroundImageView()
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
    }
}




struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView(user: .constant(User()))
    }
}
