//
//  HomeView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 11.03.23.
//

import SwiftUI

struct HomeScreenView: View {
    @EnvironmentObject var viewModel: NFTViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: .secondarySystemBackground)
                ScrollView(.vertical,
                           showsIndicators: false) {
                    VStack(spacing: 0) {
                        ShopName()
                        CategoryListView(viewModel: viewModel)
                            .padding(.bottom, Constants.Spacing.xxlarge)
                        CollectionListView(viewModel: viewModel)
                            .padding(.bottom, Constants.Spacing.xxlarge)
                        NFTListView(nftItems: viewModel.nftItems)
                    }
                    .padding(.horizontal)
                }
                .padding(.top, Constants.Spacing.xxlarge)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}


