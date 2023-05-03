//
//  MyNFTsView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 30.04.23.
//

import SwiftUI

struct MyNFTsView: View {
    @EnvironmentObject var viewModel: UserViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView() {
            LazyVGrid(
                columns: columns,
                spacing: Constants.Spacing.standard
            ) {
                ForEach(viewModel.myNftItems) { nftItem in
                    //NavigationLink(value: nftItem) {
                    RoundedImageView(
                        imageUrlAsString: Constants.Api.Images.nftItemsBaseUrl + nftItem.imageUrl
                    )
                    .padding(8.0)
                    //}
                }
            }
        }
    }
}

struct MyNFTsView_Previews: PreviewProvider {
    static var previews: some View {
        MyNFTsView()
            .environmentObject(UserViewModel())
    }
}
