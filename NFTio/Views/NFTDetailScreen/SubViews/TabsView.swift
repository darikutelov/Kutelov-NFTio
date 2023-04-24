//
//  TabsView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 19.04.23.
//

import SwiftUI

struct TabsView: View {
    enum Tab {
        case details
        case bids
    }
    
    @State private var selectedTab = Tab.details
    
    var body: some View {
        VStack {
            CustomSegmentedControl(selection: $selectedTab) {
                Text("Details")
                    .segmentedControlItemTag(Tab.details)
                Text("Bids")
                    .segmentedControlItemTag(Tab.bids)
            }
            VStack {
                switch selectedTab {
                case .details:
                    DetailsTabView()
                        .transition(.slide)
                case .bids:
                    BidsTabView()
                        .transition(.slide)
                }
                
                // TODO: - More from this collection
            }
            padding(.vertical)
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
