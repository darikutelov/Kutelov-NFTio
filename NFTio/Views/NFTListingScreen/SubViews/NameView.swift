//
//  NameView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 26.02.23.
//

import SwiftUI

struct NameView: View {
    var name: String
    
    var body: some View {
        HStack {
            Text("\(name)")
                .font(.title3)
                .fontWeight(.medium)
                .foregroundColor(Color("Black"))
            Spacer()
        }
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(name: "#1234")
    }
}
