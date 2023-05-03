//
//  CollectionFullListView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 3.05.23.
//

import SwiftUI

struct CollectionFullListView: View {
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
                ScrollView {
                    VStack(
                        alignment: .leading,
                        spacing: Constants.Spacing.small
                    ) {
                        ForEach(
                            $viewModel.nftCollections.wrappedValue ?? [NFTCollection]()
                        ) {collection in
                            NavigationLink(value: collection) {
                                collection.view
                            }
                        }
                    }
                    .navigationDestination(for: NFTCollection.self) { collection in
                        CollectionFullView(selectedCollection: collection)
                    }
                }
            }
        }
        .padding()
    }
}

struct CollectionFullListView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionFullListView()
    }
}
