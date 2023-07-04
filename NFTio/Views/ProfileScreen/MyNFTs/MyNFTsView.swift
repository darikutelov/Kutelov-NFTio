//
//  MyNFTsView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 30.04.23.
//

import SwiftUI

struct MyNFTsView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: UserViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                spacing: Constants.Spacing.standard
            ) {
                ForEach(viewModel.myNftItems) { nftItem in
                    NavigationLink {
                        MyNFTDetailView(myNftItem: nftItem)
                    } label: {
                        RoundedImageView(
                            imageUrlAsString: Constants.Api.Images.nftItemsBaseUrl + nftItem.imageUrl
                        )
                        .scaledToFit()
                        .padding(Constants.Spacing.small)
                    }
                }
            }
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
            ToolbarItem(placement: .principal) {
                HStack {
                    Spacer()
                    Text(Constants.Text.Auth.myNFTItemsTitle)
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(Constants.Colors.secondary))
                    Spacer()
                }
                .padding(.leading, -Constants.Spacing.xxlarge)
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
