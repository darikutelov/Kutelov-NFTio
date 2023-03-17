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
            ZStack {
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: Constants.Spacing.large)
                    .foregroundColor(.red)
                    .padding(Constants.Spacing.small)
                    .background(
                        RoundedRectangle(cornerRadius: .infinity)
                            .fill(Color(.white))
                            .opacity(0.45)
                    )
                Text("\(numberOfLikes)")
                    .font(.system(size: Constants.Spacing.small))
                    .foregroundColor(Color(.white))
                    .fontWeight(.regular)
                    .alignmentGuide(VerticalAlignment.center) {
                        $0.height - 3.5
                    }
            }
        }
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView(numberOfLikes: 23)
    }
}
