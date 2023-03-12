//
//  CategoryListView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 11.03.23.
//

import SwiftUI

struct CategoryListView: View {
    @ObservedObject var viewModel: HomeViewViewModel
    
    var body: some View {
        VStack {
            Section(
                header: SectionHeaderView(sectionName: "Categories")
                    .padding(.bottom, Constants.Spacing.small)
            ) {
                ScrollView(.horizontal) {
                    HStack(
                        alignment: .top,
                        spacing: Constants.Spacing.medium
                    ) {
                        ForEach(viewModel.categories) {category in
                            NavigationLink(
                                destination: CategoryView(
                                    viewModel: viewModel,
                                    selectedCategory: category
                                )
                            ) {
                                category.view
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                }
                .scrollIndicators(.hidden)
        }
        }
    }
}

extension Category {
    var view: some View {
        VStack(spacing: Constants.Spacing.standard) {
            RoundedImageView(imageUrlAsString: imageUrl)
                .frame(
                    width: Constants.Spacing.superLarge,
                    height: Constants.Spacing.superLarge
                )
            Text(name.rawValue.capitalized)
                .font(.footnote)
                .fontWeight(.medium)
                .frame(maxWidth: Constants.Spacing.superLarge)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView(viewModel: HomeViewViewModel())
            .frame(maxHeight: 200)
    }
}
