//
//  ShopName.swift
//  NFTio
//
//  Created by Dariy Kutelov on 12.03.23.
//

import SwiftUI

struct ShopName: View {
    var body: some View {
        HStack {
            AppIconView(cornerRadius: Constants.Spacing.xsmall)
                .frame(width: 28, height: 28)
            Text("NFTio")
                .font(.system(size: 34))
                .fontWeight(.semibold)
                .kerning(0.15)
            Spacer()
        }.padding(.vertical, Constants.Spacing.xxlarge)
    }
}

struct ShopName_Previews: PreviewProvider {
    static var previews: some View {
        ShopName()
    }
}
