//
//  TextViews.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct Title: View {
    var text: String
    
    var body: some View {
        Text("\(text)".capitalized)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(Color(Constants.Colors.primaryText))
            .multilineTextAlignment(.center)
    }
}

struct CardTitle: View {
    var text: String
    
    var body: some View {
        Text("\(text)".capitalized)
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundColor(Color(Constants.Colors.primaryText))
            .lineSpacing(1.25)
            .kerning(0.2)
    }
}

struct Label: View {
    var text: String
    
    var body: some View {
        Text("\(text)")
            .font(.caption)
            .fontWeight(.regular)
            .foregroundColor(Color(Constants.Colors.primaryText))
            .lineSpacing(1.39)
            .kerning(0.2)
            .opacity(0.6)
    }
}

struct CardSubheading: View {
    var text: String
    
    var body: some View {
        Text("\(text)")
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundColor(Color(Constants.Colors.primaryText))
            .lineSpacing(1.25)
            .kerning(0.2)
            .opacity(0.6)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        Title(text: "buy now")
        CardTitle(text: "#3479")
        Label(text: "Price")
    }
}
