//
//  CategoryView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 12.03.23.
//

import SwiftUI

struct CategoryView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: NFTViewModel
    
    let selectedCategory: Category
    
    var body: some View {
            ZStack {
                Color(uiColor: .secondarySystemBackground)
                ScrollView {
                    Spacer()
                        .frame(height: Constants.Spacing.xxxlarge)
                    NFTListView(
                        nftItems: $viewModel.filteredNftItems,
                        sectionName: "\(Constants.Text.NFTItems.nftItems) (\(viewModel.filteredNftItems.count))"
                    )
                    .onAppear {
                        viewModel.setSelectedCategory(
                            category: selectedCategory
                        )
                    }
                    .navigationTitle("\(selectedCategory.name.rawValue)")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden(true)
                    .toolbar {
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                dismiss()
                            } label: {
                                Image(systemName: Constants.Text.IconNames.arrowBack)
                                    .foregroundColor(Color(Constants.Colors.primaryText))
                            }
                        }
                    }
                    .padding(.horizontal)
                }.padding(.top, Constants.Spacing.xxlarge)
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
