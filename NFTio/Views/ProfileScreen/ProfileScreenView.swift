//
//  ProfileScreenView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import SwiftUI

struct ProfileScreenView: View {
    @EnvironmentObject var viewModel: UserViewModel
    @AppStorage(Constants.Text.TabView.userdefaultsKey) var selectedTab = 0
    
    var body: some View {
        NavigationStack {
            ZStack(
                alignment: Alignment(horizontal: .center, vertical: .top)
            ) {
                Color(uiColor: .secondarySystemBackground)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                    if let userAvatar = viewModel.user?.avatarUrl {
                        RoundedImageView(
                            imageUrlAsString: Constants.Api.Images.userBaseUrl +   userAvatar
                        )
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: Constants.Spacing.megaLarge,
                               height: Constants.Spacing.megaLarge)
                        .padding(.bottom)
                    } else {
                        AvatarPlaceHolder(username: viewModel.user?.username)
                    }
                    
                    Text("Username")

                    Text("Email")

                    Text("Wallet")

                    Text("Wallet Address")
                    
                    HStack {
                        Text("Edit")
                        Text("My NFTs")
                    }
                    
                    Button {
                        viewModel.logoutUser()
                        selectedTab = 0
                    } label: {
                        ButtonView(buttonText: Constants.Text.Auth.logout)
                            .frame(maxWidth: Constants.Spacing.maxWidth)
                    }
                }
                .padding(.horizontal)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Spacer()
                        Text(Constants.Text.Auth.title)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(Constants.Colors.secondary))
                        Spacer()
                    }
                }
            }
        }
    }
}

struct ProfileScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreenView()
            .environmentObject(UserViewModel())
    }
}

struct AvatarPlaceHolder: View {
    let username: String?
    
    var body: some View {
        Image(systemName: Constants.Text.IconNames.personFilled)
            .font(.system(size: Constants.Spacing.xxxlarge))
            .foregroundColor(.white)
            .frame(width: Constants.Spacing.megaLarge,
                   height: Constants.Spacing.megaLarge)
            .background {
                Circle().fill(
                    LinearGradient(
                        colors: [
                            Color(Constants.Colors.secondary),
                            Color(Constants.Colors.charcoal).opacity(0.7)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
            .padding(.bottom)
    }
}
