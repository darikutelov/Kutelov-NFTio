//
//  AppIconView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 23.02.23.
//

import SwiftUI

struct AppIconView: View {
    var cornerRadius = Constants.Spacing.standard
    
    var body: some View {
        Image(Constants.ImageFileNames.appIcon)
            .resizable()
            .scaledToFill()
            .cornerRadius(cornerRadius)
    }
}


struct AppIconView_Previews: PreviewProvider {
    static var previews: some View {
        AppIconView()
            .frame(width: 200, height: 200)
    }
}
