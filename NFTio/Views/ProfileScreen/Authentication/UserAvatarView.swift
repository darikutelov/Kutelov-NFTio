//
//  UserAvatarView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 30.04.23.
//

import SwiftUI
import PhotosUI

struct ProfileImage: View {
    let imageState: UserViewModel.ImageState
    
    var body: some View {
        switch imageState {
        case .success(let image):
            image.resizable()
        case .loading:
            ProgressView()
        case .empty:
            Image(systemName: "person.fill")
                .font(.system(size: Constants.Spacing.xxxlarge))
                .foregroundColor(.white)
        case .failure:
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: Constants.Spacing.xxxlarge))
                .foregroundColor(.white)
        }
    }
}

struct CircularProfileImage: View {
    let imageState: UserViewModel.ImageState
    
    var body: some View {
        ProfileImage(imageState: imageState)
            .scaledToFill()
            .clipShape(Circle())
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
    }
}

struct UserAvatarView: View {
    @ObservedObject var viewModel: UserViewModel
    
    var body: some View {
        CircularProfileImage(imageState: viewModel.imageState)
            .overlay(alignment: .bottomTrailing) {
                PhotosPicker(selection: $viewModel.imageSelection,
                             matching: .images,
                             photoLibrary: .shared()) {
                    Image(systemName: "pencil.circle.fill")
                        .symbolRenderingMode(.multicolor)
                        .font(.system(size: 30))
                        .foregroundColor(Color(Constants.Colors.darkYellow))
                        .padding(
                            [.bottom, .trailing], Constants.Spacing.small
                        )
                }
                .buttonStyle(.borderless)
            }
    }
}
