//
//  DetailsTabView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 19.04.23.
//

import SwiftUI

struct DetailsTabView: View {
    let nft: NFT
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(Array(
                nft.createInfoFieldsArray().enumerated()),
                    id: \.1.id) { index, infoField in
                InfoFieldCell(label: infoField.label, text: infoField.text)
                if index < 6 {
                    Divider()
                        .background(Color(Constants.Colors.secondary).opacity(1))
                }
            }
        }
        .padding(.all, Constants.Spacing.standard)
        .background {
            RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                .fill(.white)
        }
    }
}

struct DetailsTabView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsTabView(nft: NFTDataManager().nftItems[0])
    }
}
