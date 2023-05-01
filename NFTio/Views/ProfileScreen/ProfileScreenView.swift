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
                ScrollView {
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
                        
                        if let user = viewModel.user {
                            VStack {
                                ForEach(Array(
                                    user.createInfoFieldsArray().enumerated()),
                                        id: \.1.id) { index, infoField in
                                    InfoFieldCell(label: infoField.label, text: infoField.text)
                                    if index < 3 {
                                        Divider()
                                    }
                                }
                            }
                            .padding(.all, Constants.Spacing.standard)
                            .background {
                                RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                                    .fill(.white)
                            }
                            
                        }
                        
                        HStack(spacing: 12.0) {
                            NavigationLink {
                                EditProfileView()
                            } label: {
                                LinkButton(
                                    text: "Edit",
                                    bgColor: Constants.Colors.darkYellow,
                                    iconName: Constants.Text.IconNames.squarePencilIcon
                                )
                            }
                            
                            Spacer()
                            
                            NavigationLink {
                                MyNFTsView()
                            } label: {
                                LinkButton(
                                    text: "My NFTs",
                                    bgColor: Constants.Colors.primary,
                                    iconName: Constants.Text.IconNames.dolarSignSquare
                                )
                            }
                        }
                        
                        Button {
                            viewModel.logoutUser()
                            selectedTab = 0
                        } label: {
                            ButtonView(buttonText: Constants.Text.Auth.logout)

                        }
                    }
                    .frame(maxWidth: 350)
                }
                .scrollIndicators(.hidden)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Spacer()
                        Text(Constants.Text.Auth.title)
                            .font(.title)
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

struct LinkButton: View {
    let text: String
    let bgColor: String
    let iconName: String
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: iconName)
                .symbolRenderingMode(.multicolor)
                .font(.system(size: Constants.Spacing.xlarge))
                .foregroundColor(.white)
                .padding(.bottom, Constants.Spacing.small)
            Text(text)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(minWidth: 140, minHeight: 100)
        .background {
            RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                .fill(
                    LinearGradient(
                        colors: [
                            Color(bgColor),
                            Color(bgColor).opacity(0.8)
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
//                .aspectRatio(1.0, contentMode: .fit)
        }
        .padding()
    }
}
