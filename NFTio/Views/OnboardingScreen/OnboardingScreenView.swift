//
//  OnboardingScreenView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 18.02.23.
//

import SwiftUI

struct OnboardingScreenView: View {
    @Binding var isOnboardingScreenOpen: Bool
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                AppLogo()
                    .padding(.bottom, Constants.Spacing.large)
                DescriptionTextView()
                    .padding(.bottom, Constants.Spacing.xlarge)
                Button {
                    isOnboardingScreenOpen.toggle()
                } label: {
                    GetStartedButton()
                }
                HStack {
                    Spacer()
                }
            }
            .padding(Constants.Spacing.xxlarge)
            .background {
                Rectangle()
                    .fill(
                        Color(Constants.Colors.primary)
                    )
                    .cornerRadius(Constants.General.roundedRectCornerRadius)
                    .padding(.bottom, -Constants.Spacing.xxlarge)
                    .ignoresSafeArea(.all)
            }
        }
        .background(
            Image(Constants.ImageFileNames.onboardingBackground)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
        )
    }
}

struct OnboardingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingScreenView(isOnboardingScreenOpen: .constant(true))
    }
}
