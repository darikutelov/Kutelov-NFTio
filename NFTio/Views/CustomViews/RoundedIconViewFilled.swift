//
//  RoundedIconViewFilled.swift
//  NFTio
//
//  Created by Dariy Kutelov on 23.02.23.
//

import SwiftUI

struct RoundedIconViewFilled: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.caption)
            .foregroundColor(Color(.white))
            .frame(
                width: Constants.General.roundedViewLength,
                height: Constants.General.roundedViewHeight
            )
            .background(
                Circle()
                    .fill(Color(Constants.Colors.terciary))
            )
    }
}


struct RoundedIconViewFilled_Previews: PreviewProvider {
    static var previews: some View {
        RoundedIconViewFilled(systemName: "play.fill")
    }
}
