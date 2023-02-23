//
//  RoundedIconViewFilledWhite.swift
//  NFTio
//
//  Created by Dariy Kutelov on 23.02.23.
//

import SwiftUI

struct RoundedIconViewFilledWhite: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .foregroundColor(Color(Constants.Colors.primary))
            .font(.title3)
            .padding()
            .background(
                Circle()
                    .fill(Color(.white))
            )
    }
}

struct RoundedIconViewFilledWhite_Previews: PreviewProvider {
    static var previews: some View {
        RoundedIconViewFilledWhite(systemName: "arrow.forward")
    }
}
