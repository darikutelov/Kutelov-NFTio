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
      
                Image(systemName: "heart.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: Constants.Spacing.large)
                    .foregroundColor(.red)
              
   
            .padding(Constants.Spacing.small)
            .background(
                RoundedRectangle(cornerRadius: .infinity)
                    .fill(Color("Black"))
                    .opacity(0.2)
            )
            .overlay {
                Text("\(numberOfLikes)")
                    .font(.system(size: 8.0))
                    .foregroundColor(.white)
                    .fontWeight(.semibold)
                    .frame(
                        width: Constants.Spacing.xlarge,
                        height: Constants.Spacing.medium,
                        alignment: .bottomTrailing
                    )
            
            }
        }
    }
}

struct LikesView_Previews: PreviewProvider {
    static var previews: some View {
        LikesView(numberOfLikes: 23)
    }
}
