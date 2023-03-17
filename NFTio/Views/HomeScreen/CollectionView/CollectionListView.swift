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
                    ForEach(viewModel.collections) {collection in
                        NavigationLink(value: collection) {
                            collection.view
                        }
                    }
                }
                .navigationDestination(for: Collection.self) { collection in
                    CollectionView(selectedCollection: collection)
                }
                
            }
            HStack() {
                Spacer()
                Text(Constants.Text.Home.seeAllLabel)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(Color(Constants.Colors.primary))
            }
        }
    }
}

extension Collection {
    var view: some View {
        HStack {
            RoundedImageView(
                imageUrlAsString: Constants.Api.collectionBaseUrl + imageUrl,
                roundedCornerSize: .infinity)
            .frame(
                width: Constants.Spacing.xxxlarge,
                height: Constants.Spacing.xxxlarge
            )
            VStack(
                alignment: .leading,
                spacing: Constants.Spacing.small / 2
            ) {
                Text(collectionName)
                    .font(.callout)
                    .kerning(0.5)
                    .fontWeight(.medium)
                    .foregroundColor(Color("TextColor"))
                    .lineLimit(1)
                Text("Floor: \(NumberFormatter.ethereumCurrencyFormatter.string(from: floorPrice as NSNumber) ?? "0")")
                    .font(.footnote)
                    .foregroundColor(Color("TextColor").opacity(0.8))
            }
            .padding(.leading, Constants.Spacing.small)
            Spacer()
            Text("\(NumberFormatter.ethereumCurrencyFormatter.string(from: totalVolume as NSNumber) ?? "0")")
                .foregroundColor(Color("TextColor"))
                .font(.footnote)
                .fontWeight(.bold)
        }
    }
}

struct CollectionListView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionListView()
    }
}
