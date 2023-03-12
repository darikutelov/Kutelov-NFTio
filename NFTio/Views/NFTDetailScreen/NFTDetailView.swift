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
            ScrollView {
                GeometryReader { proxy in
                VStack {
                    TopInfoSectionView(
                        nft: viewModel.nft,
                        proxy: proxy
                    )
                }
            }
            .navigationTitle("Details")
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
            .padding()
        }
    }
}

struct NFTDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NFTDetailView(nft: NFTDataManager().nftItems[0])
    }
}
