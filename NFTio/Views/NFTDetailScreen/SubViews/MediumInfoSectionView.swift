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
            
            VStack {
                switch selectedTab {
                case .details:
                    DetailsTabView()
                        .transition(.slide)
                case .bids:
                    BidsTabView()
                        .transition(.slide)
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
