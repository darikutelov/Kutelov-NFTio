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
        case .loading:
            ProgressView()
        case .empty:
            Image(systemName: "person.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
        case .failure:
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 40))
                .foregroundColor(.white)
        }
    }
}

struct CircularUploadImageView: View {
    let imageState: ImageUploadView.ImageState
    
    var body: some View {
        ImageUploadView(imageState: imageState)
            .scaledToFill()
            .clipShape(
                RoundedRectangle(
                    cornerRadius: Constants.General.roundedRectCornerRadius
                )
            )
            .frame(maxWidth: 400, maxHeight: 400)
            .background {
                RoundedRectangle(
                    cornerRadius: Constants.General.roundedRectCornerRadius
                )
                .fill(
                    LinearGradient(
                        colors: [.yellow, .orange],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .aspectRatio(1.0, contentMode: .fit)
            }
    }
}

struct EditableUploadImageView: View {
    @ObservedObject var viewModel: AddNFTViewModel
    
    var body: some View {
        CircularUploadImageView(imageState: viewModel.imageState)
            .overlay(alignment: .bottomTrailing) {
                PhotosPicker(selection: $viewModel.imageSelection,
                             matching: .images,
                             photoLibrary: .shared()) {
                    Image(systemName: "pencil.circle.fill")
                        .symbolRenderingMode(.multicolor)
                        .font(.system(size: 30))
                        .foregroundColor(.accentColor)
                }
                .buttonStyle(.borderless)
            }
    }
}

struct ImageUploadView_Previews: PreviewProvider {
    static var previews: some View {
        ImageUploadView(imageState: .empty)
    }
}
