//
//  CollectionListView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 11.03.23.
//

import SwiftUI

struct CollectionListView: View {
    @EnvironmentObject var viewModel: NFTViewModel
    
    var body: some View {
        VStack {
            Section(
                header: SectionHeaderView(
                    sectionName: Constants.Text.Home.collectionsLabel,
                    secondaryLabel: Constants.Text.Home.volumeLabel
                )
                .padding(.bottom, Constants.Spacing.small)
            ) {
                
                VStack(
                    alignment: .leading,
                    spacing: Constants.Spacing.small
                ) {
                    ForEach(
                        $viewModel.homePageCollections.wrappedValue ?? [NFTCollection]()
                        ) {collection in
                        NavigationLink(value: collection) {
                            collection.view
                        }
                    }
                    
                    Spacer()
                }
                .navigationDestination(for: NFTCollection.self) { collection in
                    CollectionView(selectedCollection: collection)
                }
                
            }
        }
    }
}

extension NFTCollection {
    var view: some View {
        HStack {
            RoundedImageView(
                imageUrlAsString: Constants.Api.Images.collectionBaseUrl + (imageUrl ?? ""),
                roundedCornerSize: .infinity)
            .frame(
                width: Constants.Spacing.xxxlarge,
                height: Constants.Spacing.xxxlarge
            )
            VStack(
                alignment: .leading,
                spacing: Constants.Spacing.small / 2
            ) {
                Text(name)
                    .font(.callout)
                    .kerning(0.5)
                    .fontWeight(.medium)
                    .foregroundColor(Color(Constants.Colors.primaryText))
                    .lineLimit(1)
                Text("Floor: \(NumberFormatter.ethereumCurrencyFormatter.string(from: floorPrice as NSNumber) ?? "0")")
                    .font(.footnote)
                    .foregroundColor(Color(Constants.Colors.primaryText).opacity(0.8))
            }
            .padding(.leading, Constants.Spacing.small)
            Spacer()
            Text("\(NumberFormatter.ethereumCurrencyFormatter.string(from: totalVolume as NSNumber) ?? "0")")
                .foregroundColor(Color(Constants.Colors.primaryText))
                .font(.footnote)
                .fontWeight(.bold)
        }
    }
}

struct CollectionListView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionListView()
            .environmentObject(NFTViewModel())
    }
}
