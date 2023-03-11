//
//  SectionHeaderView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 11.03.23.
//

import SwiftUI

struct SectionHeaderView: View {
    let sectionName: String
    var secondaryLabel: String?
    
    var body: some View {
        HStack {
            Text("\(sectionName)")
                .font(.title3)
                .fontWeight(.bold)
            Spacer()
            if let label = secondaryLabel {
                Text("\(label)")
                    .foregroundColor(
                        Color(Constants.Colors.primary)
                    )
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
        }
    }
}

struct SectionHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderView(sectionName: "Categories")
    }
}
