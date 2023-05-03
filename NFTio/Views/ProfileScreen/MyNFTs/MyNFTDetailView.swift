//
//  MyNFTDetailView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 3.05.23.
//

import SwiftUI

struct MyNFTDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let myNftItem: MyINFItem
    
    var body: some View {
        VStack {
            RoundedImageView(
                imageUrlAsString: Constants.Api.Images.nftItemsBaseUrl + myNftItem.imageUrl
            )
            .scaledToFit()
            .padding(Constants.Spacing.small)
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(
                placement: .navigationBarLeading
            ) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: Constants.Text.IconNames.arrowBack)
                        .foregroundColor(Color(Constants.Colors.primaryText))
                }
                
            }
        }
    }
}

struct MyNFTDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MyNFTDetailView(myNftItem: MyINFItem(id: "6451089fadf1f073849214a7", imageUrl: "sagrrklxmzekrdzlin2h.jpg"))
    }
}
