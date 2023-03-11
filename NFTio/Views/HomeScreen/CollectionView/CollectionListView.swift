//
//  CollectionListView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 11.03.23.
//

import SwiftUI

struct CollectionListView: View {
    @ObservedObject var viewModel: HomeViewViewModel
    
    var body: some View {
        VStack {
            Section(
                header: SectionHeaderView(
                    sectionName: "Collections",
                    secondaryLabel: "Volume"
                )
                .padding(.bottom, Constants.Spacing.small)
            ) {
                
                VStack(
                    alignment: .leading,
                    spacing: Constants.Spacing.small
                ) {
                    ForEach(viewModel.collections) {collection in
                        NavigationLink(
                            destination: NFTListView(
                                viewModel: viewModel
                            )
                        ) {
                            collection.view
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                
            }
            HStack() {
                Spacer()
                Text("See All")
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
            RoundImageView(
                urlAsString: Constants.Api.collectionBaseUrl + imageUrl,
                size: Constants.Spacing.xxxlarge)
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
                Text("Floor: \(floorPrice) ETH" as String)
                    .font(.footnote)
                    .foregroundColor(Color("TextColor").opacity(0.8))
            }
            .padding(.leading, Constants.Spacing.small)
            Spacer()
            Text("\(totalVolume) ETH")
                .foregroundColor(Color("TextColor"))
                .font(.footnote)
                .fontWeight(.bold)
        }
    }
}

struct CollectionListView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionListView(viewModel: HomeViewViewModel())
    }
}
