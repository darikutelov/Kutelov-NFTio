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
        VStack {
            Text(isAuctionExpired ?
                 Constants.Text.NFTDetail.expiredAuctionMessage:
                    Constants.Text.NFTDetail.auctionEndsOnLabel + "\(formattedExpiryDate)")
            .font(.subheadline)
            .fontWeight(.light)
            .multilineTextAlignment(.center)
            .foregroundColor(Color(Constants.Colors.primaryText)).opacity(0.9)
            .padding(.vertical)
            
            if !isAuctionExpired {
                Text(Constants.Text.NFTDetail.timeLeftLabel.uppercased())
                    .foregroundColor(Color(Constants.Colors.charcoal))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                HStack(spacing: Constants.Spacing.standard) {
                    ForEach(TimeUnit.allCases, id: \.self.rawValue) {
                        TimeUnitView(
                            timeUnit: $0,
                            timeLeftInSeconds: $timeUntilExpiration)
                    }
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
        .padding(.bottom)
        Divider()
    }
}

struct TimeUnitView: View {
    let timeUnit: TimeUnit
    @Binding var timeLeftInSeconds: Int
    
    var body: some View {
        VStack {
            Text(timeUnit.getTimeUnitValue(totalRemainingSeconds: timeLeftInSeconds))
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top)
            HStack {
                Text(timeUnit.rawValue.capitalized)
                    .font(.caption2)
                    .fontWeight(.light)
                
            }
            .frame(maxWidth: .infinity,
                   minHeight: Constants.Spacing.xxlarge)
            .background(
                Rectangle()
                    .frame(height: Constants.Spacing.xxlarge)
                    .foregroundColor(Color(Constants.Colors.charcoal))
                    .padding(.top, Constants.Spacing.small)
                    .cornerRadius(Constants.Spacing.small)
                    .padding(.top, -Constants.Spacing.small)
            )
        }
        .frame(
            width: Constants.Spacing.xxxlarge + Constants.Spacing.standard
        )
        .foregroundColor(Color(Constants.Colors.white))
        .background(
            RoundedRectangle(cornerRadius: Constants.Spacing.small)
                .fill(Color(Constants.Colors.charcoal))
                .opacity(0.5)
        )
    }
}

struct TimerSectionView_Previews: PreviewProvider {
    static var previews: some View {
        TimerSectionView(auctionExpiryDate: NFTDataManager().nftItems[0].auctionExpiryDate!)
    }
}
