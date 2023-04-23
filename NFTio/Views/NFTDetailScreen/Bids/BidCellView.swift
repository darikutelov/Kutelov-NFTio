//
//  BidCellView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 23.04.23.
//

import SwiftUI

struct BidCellView: View {
    let bid: Bid
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: Constants.Spacing.small) {
                    Text("\(bid.price.priceInCryptoCurrency.rounded(3, .bankers)) \(bid.price.cryptoCurrency.rawValue)" as String)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(Constants.Colors.primary))
                    // swiftlint:disable:next line_length
                    Text("\(Formatter.withSeparator.string(from: (bid.price.priceInCryptoCurrency * Constants.ExchangeRates.usdToEth) as NSNumber) ?? "")")
                        .font(.subheadline)
                        .foregroundColor(Color(Constants.Colors.terciary))
                }
                .padding()
                Spacer()
                VStack(alignment: .trailing, spacing: Constants.Spacing.small) {
                    Text("\(bid.user.username)")
                        .foregroundColor(Color(Constants.Colors.terciary))
                    HStack {
                        Text(bid.date ?? Date.now, style: .date)
                        Text("at")
                        Text(bid.date ?? Date.now, style: .time)
                    }
                    .font(.footnote)
                }
                .padding()
            }
        }
    }
}

struct BidCellView_Previews: PreviewProvider {
    static var previews: some View {
        BidCellView(bid: NFTDataManager().nftItems[0].bids[0])
    }
}
