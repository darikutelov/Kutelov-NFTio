//
//  CategoryView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 12.03.23.
//

import SwiftUI

struct CategoryView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: HomeViewViewModel
    let selectedCategory: Category
    
    
    var body: some View {
        ScrollView {
            NFTListView(nftItems: viewModel.filteredNftItems)
            .onAppear {
                viewModel.setSelectedCategory(category: selectedCategory)
            }
            .navigationTitle("\(selectedCategory.name.rawValue)")
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
            .onDisappear {
                viewModel.setSelectedCategory(category: nil)
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(viewModel: HomeViewViewModel(), selectedCategory: Category.categories[0])
    }
}
