//
//  HomeBackgroundImageView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 23.02.23.
//

import SwiftUI

struct HomeBackgroundImageView: View {
    var body: some View {
        Image(systemName: "bitcoinsign.circle")
            .font(.system(size: Constants.General.roundedRectViewWidth * 2.15))
            .rotationEffect(.degrees(Constants.Spacing.xxlarge))
            .rotation3DEffect(
                .degrees(Constants.Spacing.xxlarge),
                axis: (x: 1, y: 0, z: 0))
            .foregroundColor(Color(Constants.Colors.primaryText))
            .opacity(0.1)
    }
}

struct HomeBackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        HomeBackgroundImageView()
    }
}
