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
        
        if text.count < 20 {
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
        } else {
            VStack(alignment: .leading, spacing: Constants.Spacing.xsmall) {
                Text(label)
                    .foregroundColor(Color(Constants.Colors.primaryText)
                        .opacity(0.7))
                    .font(.callout)
                    Text(text)
                        .foregroundColor(Color(Constants.Colors.secondary))
                        .font(.headline)
                        .fontWeight(.semibold)
            }
            .frame(minHeight: Constants.Spacing.xxlarge + Constants.Spacing.xsmall)
        }
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
