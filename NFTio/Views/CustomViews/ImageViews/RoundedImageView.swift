//
//  SquareRoundedImageView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 11.03.23.
//

import SwiftUI

struct RoundedImageView: View {
    let imageUrlAsString: String
    var roundedCornerSize: CGFloat = Constants.Spacing.standard
    
    var body: some View {
        if let url = URL(string: imageUrlAsString) {
            AsyncImage(url: url) { response in
                switch response {
                case .empty:
                    ProgressView()
                        .accentColor(Color(Constants.Colors.primary))
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                        .cornerRadius(roundedCornerSize)
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            Image(systemName: "photo")
        }
    }
}

struct SquareRoundedImageView_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImageView(
            imageUrlAsString: Constants.Api.categoryBaseUrl + "art.jpg")
    }
}
