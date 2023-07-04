//
//  MediumInfoSectionView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 19.04.23.
//

import SwiftUI

struct MediumInfoSectionView: View {
    enum Tab {
        case details
        case bids
    }
    
    @State private var selectedTab = Tab.details
    let nft: NFT
    
    var body: some View {
        VStack {
            CustomSegmentedControl(selection: $selectedTab) {
                Text("Details")
                    .segmentedControlItemTag(Tab.details)
                Text("Bids")
                    .segmentedControlItemTag(Tab.bids)
            }
            .padding(.vertical)
            
            VStack(alignment: .leading) {
                switch selectedTab {
                case .details:
                    DetailsTabView(nft: nft)
                        .transition(.slide)
                case .bids:
                    BidsTabView()
                        .transition(.backslide)
                }
            }
            .padding(.vertical)
        }
        .padding()
    }
}

struct MediumInfoSectionView_Previews: PreviewProvider {
    static var previews: some View {
        MediumInfoSectionView(nft: NFTDataManager().nftItems[0])
    }
}
