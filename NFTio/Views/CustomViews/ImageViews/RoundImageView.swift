//
//  RoundImageView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 11.03.23.
//

import SwiftUI

struct RoundImageView: View {
    let urlAsString: String
    let size: CGFloat
    
    var body: some View {
        if let url = URL(string: urlAsString) {
            AsyncImage(url: url) { response in
                switch response {
                case .empty:
                    ProgressView()
                        .frame(width: size, height: size)
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size)
                        .aspectRatio(1, contentMode: .fill)
                        .cornerRadius(.infinity)
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
                .frame(
                    width: size,
                    height: size
                )
        }
    }
}
struct RoundImageView_Previews: PreviewProvider {
    static var previews: some View {
        RoundImageView(
            urlAsString: Constants.Api.collectionBaseUrl + "real-vision.png",
            size: 150
        )
    }
}
