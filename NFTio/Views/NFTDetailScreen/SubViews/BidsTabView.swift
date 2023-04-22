//
//  BidsView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 19.04.23.
//

import SwiftUI
import Combine

struct BidsTabView: View {
    @EnvironmentObject var nftViewModel: NFTViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State var price: String = ""
    @State var bidCurrency: CryptoCurrency = CryptoCurrency.ethereum
    @State var errorMessage = ""
    
    var body: some View {
        VStack {
            if let nft = nftViewModel.selectedNFT {
                if !nft.bids.isEmpty {
                    Text("\(nft.bids.count)")
                } else {
                    Text("Be the first to place a bid for this item!")
                }
            }
            
            Section {
                TextField("",
                          text: $price,
                          prompt: Text("Enter your bidding price")
                    .foregroundColor(Color(Constants.Colors.charcoal).opacity(0.7)))
                .keyboardType(.numbersAndPunctuation)
                .onReceive(Just(price)) { newValue in
                    let filtered = newValue.filter { "0123456789.".contains($0) }
                    if filtered != newValue {
                        self.price = filtered
                    }
                }
                .modifier(StandardInputField(error: !errorMessage.isEmpty))
                .padding(.bottom, Constants.Spacing.standard)
                
                Menu {
                    Picker("Currency", selection: $bidCurrency) {
                        ForEach(CryptoCurrency.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                } label: {
                    HStack {
                        Text("Select Crypto Currency")
                            .foregroundColor(Color(Constants.Colors.charcoal).opacity(0.7))
                            .padding()
                        Spacer()
                    }
                }
                .overlay(
                    RoundedRectangle(cornerRadius: Constants.Spacing.small)
                        .stroke(Color(Constants.Colors.secondary), lineWidth: 1.0)
                )
                .frame(maxWidth: 400)
                .padding(.bottom, Constants.Spacing.standard)
            }
        }
    }
}

struct BidsTabView_Previews: PreviewProvider {
    static var previews: some View {
        BidsTabView()
            .environmentObject(NFTViewModel())
            .environmentObject(UserViewModel())
    }
}
