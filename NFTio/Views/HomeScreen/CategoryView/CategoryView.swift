//
//  CategoryView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 12.03.23.
//

import SwiftUI

struct CategoryView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var nftViewModel: NFTViewModel
    
    let selectedCategory: Category
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
                        sectionName: "\(Constants.Text.NFTItems.nftItems) (\(nftViewModel.filteredItems.count))"
                    )
                    .padding(.bottom, Constants.Spacing.small)
                ) {
                    LazyVGrid(
                        columns: columns,
                        spacing: Constants.Spacing.standard
                    ) {
                        ForEach($nftViewModel.filteredItems) { nftItem in
                            NavigationLink(value: nftItem.wrappedValue) {
                                NFTCellView(
                                    nft: nftItem
                                )
                            }
                        }
                    }
                }
                .navigationDestination(for: NFT.self) { nftItem in
                    NFTDetailView(
                        nft: nftItem
                    )
                }
                .navigationTitle("\(selectedCategory.name.rawValue)")
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
                .padding(.horizontal)
            }
            .padding(.top, Constants.Spacing.xxlarge)
        }
        .onAppear {
            nftViewModel.setSelectedCategory(
                category: selectedCategory
            )
        }
        .onDisappear {
            nftViewModel.setSelectedCategory(category: nil)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(selectedCategory: NFTDataManager().categories[0])
            .environmentObject(NFTViewModel())
    }
}
