//
//  DetailsTabView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 19.04.23.
//

import SwiftUI

struct DetailsTabView: View {
    var body: some View {
        VStack {
            Text("More about the collection")
            Text("Creator")
            Text("Current owner")
            Text("Contract address")
            Text("Token Id")
            Text("Blockchain")
            Text("Created")
            Text("Price history")
        }
    }
}

struct DetailsTabView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsTabView()
    }
}
