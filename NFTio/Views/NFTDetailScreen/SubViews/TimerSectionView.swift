//
//  TimerSectionView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 19.04.23.
//

import SwiftUI
import Combine

struct TimerSectionView: View {
    let auctionExpiryDate: Date
    let formattedExpiryDate: String
    var isAuctionExpired: Bool
    @State var timeUntilExpiration: Int = 0
    
    init(auctionExpiryDate: Date) {
        self.auctionExpiryDate = auctionExpiryDate
        self.formattedExpiryDate = auctionExpiryDate.formatted(
            .dateTime
                    .day().month(.wide).year()
                    .hour().minute()
        )
        self.isAuctionExpired = Date.now > auctionExpiryDate
    }
    
    var body: some View {
        // Check if expiry date has passed
        VStack {
            Text(isAuctionExpired ?
                 "This auction has expired. Wait for a new one!" :
                 "Auction ends on \(formattedExpiryDate). Time left:")
            
            if !isAuctionExpired {
                HStack(spacing: Constants.Spacing.standard) {
                    TimeUnitView(label: "Secs", time: "\(timeUntilExpiration)")
                }
            }
        }
        .task {
            let timerSequence = Timer
              .publish(every: 1, on: .main, in: .common)
              .autoconnect()
              .map { date -> Int in
                let timeUntilExpiration = Int(auctionExpiryDate.timeIntervalSince1970 - date.timeIntervalSince1970)
                return timeUntilExpiration
              }
              .values
            
            for await time in timerSequence {
                self.timeUntilExpiration = time
            }
        }
        Divider()
    }
}

struct TimeUnitView: View {
    let label: String
    let time: String
    
    var body: some View {
        VStack {
            Text(time)
            Text(label)
        }
    }
}

struct TimerSectionView_Previews: PreviewProvider {
    static var previews: some View {
        TimerSectionView(auctionExpiryDate: NFTDataManager().nftItems[0].auctionExpiryDate!)
    }
}
