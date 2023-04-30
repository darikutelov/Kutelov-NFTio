//
//  InfoFieldCell.swift
//  NFTio
//
//  Created by Dariy Kutelov on 30.04.23.
//

import SwiftUI

struct InfoFieldCell: View {
    let label: String
    let text: String
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Text(label)
                .foregroundColor(Color(Constants.Colors.primaryText)
                    .opacity(0.7))
                .font(.callout)
            Spacer()
            Text(text)
                .foregroundColor(Color(Constants.Colors.secondary))
                .font(.headline)
                .fontWeight(.semibold)
        }
        .frame(minHeight: Constants.Spacing.xxlarge + Constants.Spacing.xsmall)
    }
}

struct InfoFieldCell_Previews: PreviewProvider {
    static var previews: some View {
        InfoFieldCell(
            label: "Username",
            text: "Crypto42"
        )
    }
}
