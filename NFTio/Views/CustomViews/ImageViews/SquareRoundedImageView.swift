//
//  SquareRoundedImageView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 11.03.23.
//

import SwiftUI

struct SquareRoundedImageView: View {
    let imageAsString: String
    let size: CGFloat
    let roundedCornerSize: CGFloat
    
    var body: some View {
        if let url = URL(string: imageAsString) {
            AsyncImage(url: url) { response in
                switch response {
                case .empty:
                    ProgressView()
                        .frame(width: size, height: size)
                case .success(let image):
                    image.resizable()
                        .scaledToFill()
                        .frame(width: size, height: size)
                        .cornerRadius(roundedCornerSize)
                case .failure:
                    Image(systemName: "photo")
                        .frame(width: size, height: size)
                @unknown default:
                    EmptyView()
                        .frame(width: size, height: size)
                }
            }
        } else {
            Image(systemName: "photo")
                .frame(width: size, height: size)
        }
    }
}

struct SquareRoundedImageView_Previews: PreviewProvider {
    static var previews: some View {
        SquareRoundedImageView(
            imageAsString: Constants.Api.categoryBaseUrl + "art.jpg",
            size: 150,
            roundedCornerSize: 12)
    }
}
