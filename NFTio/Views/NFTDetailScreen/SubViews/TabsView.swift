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
    
    init() {
        UISegmentedControl
            .appearance()
            .backgroundColor = UIColor(named: Constants.Colors.charcoal)?
            .withAlphaComponent(0.1)
        UISegmentedControl
            .appearance()
            .setDividerImage(UIImage(),
                             forLeftSegmentState: .normal,
                             rightSegmentState: .normal,
                             barMetrics: .default)
        UISegmentedControl
            .appearance()
            .selectedSegmentTintColor = UIColor(named: Constants.Colors.secondary)
       UISegmentedControl
            .appearance()
            .setTitleTextAttributes(
                [.foregroundColor: UIColor.white],
                for: .selected)
    }
    
    var body: some View {
        VStack {
            Picker("Flavor", selection: $selectedTab) {
                Text("Details")
                    .tag(Tab.details)
                   
                Text("Bids")
                    .tag(Tab.bids)
            }
            .pickerStyle(.segmented)
            
            switch selectedTab {
            case .details:
                DetailsTabView()
                    .transition(.slide)
            case .bids:
                BidsTabView()
                    .transition(.slide)
            }
        }
    }
}

struct Tabs_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}
