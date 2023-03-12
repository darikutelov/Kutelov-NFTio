//
//  HomeView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 11.03.23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(uiColor: .secondarySystemBackground)
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical,
                           showsIndicators: false) {
                    VStack(spacing: 0) {
                        ShopName()
                        CategoryListView(viewModel: viewModel)
                            .padding(.bottom, Constants.Spacing.xxlarge)
                        CollectionListView(viewModel: viewModel)
                            .padding(.bottom, Constants.Spacing.xxlarge)
                        NFTListView(viewModel: viewModel)
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewViewModel())
    }
}


