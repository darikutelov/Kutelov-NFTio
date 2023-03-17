//
//  SearchScreenView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import SwiftUI

struct SearchScreenView: View {
    @EnvironmentObject var viewModel: NFTViewModel
    
    var body: some View {
        Text("Search Me")
    }
}

struct SearchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreenView()
    }
}
