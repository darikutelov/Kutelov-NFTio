//
//  TotalAmountLabelView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct TotalAmountLabelView: View {
    var text: String
    
    var body: some View {
        Text("\(text)".capitalized)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundColor(Color(Constants.Colors.primaryText))
            .opacity(0.8)
    }
}

struct TotalAmountLabelView_Previews: PreviewProvider {
    static var previews: some View {
        TotalAmountLabelView(text: "Total Amount")
    }
}
