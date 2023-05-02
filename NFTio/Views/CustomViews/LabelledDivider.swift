//
//  LabelledDivider.swift
//  NFTio
//
//  Created by Dariy Kutelov on 2.05.23.
//

import SwiftUI

struct LabelledDivider: View {

    let label: String
    let horizontalPadding: CGFloat
    let color: Color

    init(label: String,
         horizontalPadding: CGFloat = Constants.Spacing.large,
         color: Color = Color(Constants.Colors.secondary)
    ) {
        self.label = label
        self.horizontalPadding = horizontalPadding
        self.color = color
    }

    var body: some View {
        HStack {
            line
            Text(label).foregroundColor(color)
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }.padding(horizontalPadding)
    }
}

struct LabelledDivider_Previews: PreviewProvider {
    static var previews: some View {
        LabelledDivider(label: "or")
    }
}
