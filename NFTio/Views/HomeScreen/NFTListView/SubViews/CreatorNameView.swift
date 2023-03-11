//
//  CreatorNameView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

struct CreatorNameView: View {
    var creator: String
    
    var body: some View {
        HStack {
            Text("@\(creator)")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(Color("Black"))
                .opacity(0.6)
            Spacer()
        }
    }
}

struct CreatorNameView_Previews: PreviewProvider {
    static var previews: some View {
        CreatorNameView(creator: "Creator Name")
    }
}
