//
//  ImageUploadView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 24.04.23.
//

import SwiftUI
import PhotosUI

struct ImageUploadView: View {
    enum ImageState {
        case empty
        case loading(Progress)
        case success(Image)
        case failure(Error)
    }
    
    let imageState: ImageState
    
    var body: some View {
        switch imageState {
        case .success(let image):
            image.resizable()
                .frame(width: 300, height: 300)
        case .loading:
            ProgressView()
        case .empty:
            Image(systemName: "photo")
                .font(.system(size: 80))
                .foregroundColor(.white)
        case .failure:
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 80))
                .foregroundColor(.white)
        }
    }
}

struct SquareUploadImageView: View {
    let imageState: ImageUploadView.ImageState
    
    var body: some View {
        ImageUploadView(imageState: imageState)
            .scaledToFill()
            .clipShape(
                RoundedRectangle(
                    cornerRadius: Constants.General.roundedRectCornerRadius
                )
            )
            .frame(width: 300, height: 300)
            .background {
                RoundedRectangle(
                    cornerRadius: Constants.General.roundedRectCornerRadius
                )
                .fill(
                    LinearGradient(
                        colors: Constants.Colors.placeholderGradientColors,
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .aspectRatio(1.0, contentMode: .fit)
            }
    }
}

struct EditableUploadImageView: View {
    @ObservedObject var viewModel: AddNFTViewModel
    
    var body: some View {
        HStack {
            Spacer()
            SquareUploadImageView(imageState: viewModel.imageState)
                .overlay(alignment: .bottomTrailing) {
                    PhotosPicker(selection: $viewModel.imageSelection,
                                 matching: .images,
                                 photoLibrary: .shared()) {
                        Image(systemName: Constants.Text.IconNames.pencilIcon)
                            .symbolRenderingMode(.multicolor)
                            .font(.system(size: 40))
                            .foregroundColor(Color(Constants.Colors.secondary))
                    }
                                 .buttonStyle(.borderless)
                                 .padding()
                }
            Spacer()
        }
    }
}

struct ImageUploadView_Previews: PreviewProvider {
    static var previews: some View {
        ImageUploadView(imageState: .empty)
    }
}
