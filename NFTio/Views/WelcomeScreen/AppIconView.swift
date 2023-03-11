//
//  AppIconView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 23.02.23.
//

import SwiftUI

struct AppIconView: View {
    var body: some View {
        Image(Constants.ImageFileNames.appIcon)
            .resizable()
            .scaledToFill()
            .cornerRadius(Constants.Spacing.standard)
    }
}


struct AppIconView_Previews: PreviewProvider {
    static var previews: some View {
        AppIconView()
            .frame(width: 200, height: 200)
    }
}
