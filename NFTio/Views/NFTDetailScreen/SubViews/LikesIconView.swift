//
//  LikesIconView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 31.03.23.
//

import SwiftUI

struct LikesIconView: View {
    var isLiked: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Image(systemName: isLiked ? "heart.fill" : "heart")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: Constants.Spacing.xlarge)
                .foregroundColor(.red)
                .padding(Constants.Spacing.small)
                .background(
                    RoundedRectangle(cornerRadius: .infinity)
                        .fill(Color(.white))
                        .opacity(0.45)
                )
        }
    }
}

struct LikesIconView_Previews: PreviewProvider {
    static var previews: some View {
        LikesIconView(isLiked: false)
    }
}
