//
//  LikesView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

struct LikesView: View {
    var numberOfLikes: Int
    
    var body: some View {
        HStack {
            Spacer()
            HStack {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .font(.subheadline)
                Text("\(numberOfLikes)")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding(Constants.Spacing.small)
            .background(
                RoundedRectangle(cornerRadius: Constants.General.smallCornerRadius)
                    .fill(Color("Black"))
                    .opacity(0.15)
            )
        }
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView(numberOfLikes: 23)
    }
}
