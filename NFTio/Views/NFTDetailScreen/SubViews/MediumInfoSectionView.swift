//
//  MediumInfoSectionView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 19.04.23.
//

import SwiftUI

struct MediumInfoSectionView: View {
    let nft: NFT
    
    var body: some View {
        VStack {
            TabsView()
        }
        .padding()
    }
}

struct MediumInfoSectionView_Previews: PreviewProvider {
    static var previews: some View {
        MediumInfoSectionView(nft: NFTDataManager().nftItems[0])
    }
}
