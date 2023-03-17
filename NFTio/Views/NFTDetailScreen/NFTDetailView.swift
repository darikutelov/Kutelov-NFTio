//
//  NFTDetailView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 12.03.23.
//

import SwiftUI

struct NFTDetailView: View {
    @Environment(\.dismiss) private var dismiss
    
    private var viewModel: NFTDetailViewViewModel
    
    init(nft: NFT) {
        self.viewModel = NFTDetailViewViewModel(nft: nft)
    }
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack {
                    TopInfoSectionView(
                        nft: viewModel.nft,
                        proxy: proxy
                    )
                    ActionButtonView(
                        buttonText: Constants.Text.NFTDetail.buyButton,
                        backgroundColor: Constants.Colors.primary
                    )
                    .padding()
                }
            }
            .navigationTitle(Constants.Text.NFTDetail.screenTitle)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrow.backward")
                            .foregroundColor(Color(Constants.Colors.primaryText))
                    }
                }
            }
          
        }
    }
}

struct ActionButtonView: View {
    let buttonText: String
    let backgroundColor: String
    
    var body: some View {
        Text("\(buttonText)".uppercased())
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(Color(backgroundColor).opacity(0.9))
            .padding(
                EdgeInsets(top: 16, leading: 32, bottom: 16, trailing: 32)
            )
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 15.0)
                    .fill(Color(Constants.Colors.buttonBackground))
            )
    }
}

struct NFTDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NFTDetailView(nft: NFTDataManager().nftItems[0])
    }
}
