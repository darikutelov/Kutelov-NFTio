//
//  CollectionView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 12.03.23.
//

import SwiftUI

struct CollectionView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var nftViewModel: NFTViewModel
    
    let selectedCollection: NFTCollection
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color(uiColor: .secondarySystemBackground)
            ScrollView {
                Spacer()
                    .frame(height: Constants.Spacing.xxxlarge)
                Section(
                    header: SectionHeaderView(
                        sectionName: "\(Constants.Text.NFTItems.nftItems) (\(nftViewModel.filteredNftItems.count))"
                    )
                    .padding(.bottom, Constants.Spacing.small)
                ) {
                    LazyVGrid(
                        columns: columns,
                        spacing: Constants.Spacing.standard) {
                            ForEach(nftViewModel.filteredNftItems) { nftItem in
                            NavigationLink(value: nftItem) {
                                NFTCellView(
                                    nft: nftItem
                                )
                            }
                        }
                    }
                    .navigationDestination(for: NFT.self) { nftItem in
                        NFTDetailView(
                            nft: nftViewModel.nftItemBinding(id: nftItem.id)
                        )
                    }
                }
                .navigationTitle("\(selectedCollection.name)")
                .navigationBarTitleDisplayMode(.inline)
//                .navigationBarBackButtonHidden(true)
//                .toolbar {
//                    ToolbarItem(placement: .navigationBarLeading) {
//                        Button {
//                            dismiss()
//                        } label: {
//                            Image(systemName: Constants.Text.IconNames.arrowBack)
//                                .foregroundColor(Color(Constants.Colors.primaryText))
//                        }
//                    }
//                }
                .padding(.horizontal)
            }
            .padding(.top, Constants.Spacing.xxlarge)
        }
        .onAppear {
            nftViewModel.setSelectedCollection(
                collection: selectedCollection
            )
        }
        .onDisappear {
            nftViewModel.setSelectedCollection(collection: nil)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView(
            selectedCollection: NFTDataManager().nftItems.first!.nftCollection
        )
        .environmentObject(NFTViewModel())
    }
}
