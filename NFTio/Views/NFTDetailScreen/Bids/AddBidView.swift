//
//  AddBidView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 22.04.23.
//

import SwiftUI
import Combine

struct AddBidView: View {
    @EnvironmentObject var nftViewModel: NFTViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    
    @State var price: String = ""
    @State var bidCurrency: CryptoCurrency = CryptoCurrency.ethereum
    @State var errorMessage = ""
    @State var showError = false
    @State var isSavingData = false
    @Binding var showAddBid: Bool
    
    var body: some View {
        ZStack {
            Color(Constants.Colors.secondary)
            VStack {
                HStack {
                    Image(systemName: Constants.Text.NFTDetail.offerButtonIcon)
                        .font(.largeTitle)
                     Text("Place Your Bid")
                        .font(.title)
                }
                .foregroundColor(.white)
                .padding(.bottom, Constants.Spacing.xlarge)
                
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
                .modifier(InputField(error: !errorMessage.isEmpty))
                .padding(.bottom, Constants.Spacing.standard)
                
                Picker("Currency", selection: $bidCurrency) {
                    ForEach(CryptoCurrency.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .frame(minWidth: 300, minHeight: 50)
                .background(
                    RoundedRectangle(
                        cornerRadius: 15)
                        .fill(Color(.white))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color(.white), lineWidth: 1.0)
                )
                .padding(.bottom, Constants.Spacing.standard)
                
                Button {
                    addBid()
                } label: {
                    ButtonIconView(
                        buttonText: isSavingData ? "Saving ..." : Constants.Text.NFTDetail.makeOfferButton,
                        buttonTextColor: Constants.Colors.white,
                        buttonBackgroundColor: Constants.Colors.primary,
                        iconName: ""
                    )
                }
                .disabled(isSavingData)
            }
            .frame(maxWidth: 300)
            .alert(isPresented: $showError) {
                Alert(
                    title: Text("Error!"),
                    message: Text("\(errorMessage)"),
                    dismissButton: .default(Text("Got it!")))
            }
        }
    }
    
    private func addBid() {
        guard let user = userViewModel.user else {
            errorMessage = "You need to sign in to place a bid"
            showError = true
            return
        }
        
        guard !price.isEmpty else {
            errorMessage = "Price can not be empty"
            showError = true
            return
        }
        
        guard let price = Decimal(string: price) else {
            errorMessage = "Price is not correct! Enter price in format XXX.XX"
            showError = true
            return
        }
        
        let bid = Bid(id: nil,
                      price: Price(
                        id: nil,
                        cryptoCurrency: bidCurrency,
                        priceInCryptoCurrency: price),
                      user: user,
                      date: nil)

        Task {
            isSavingData = true
            do {
                try await nftViewModel.addNftItemBid(bid)
                isSavingData = false
                showAddBid = false
            } catch let error {
                print(error)
                
                guard let networkError = error as? APIServiceError else { return }
                
                switch networkError {
                case .invalidResponse(let message):
                    errorMessage = message
                case .failedToCreateUrl:
                    errorMessage = "Wrong Network Call"
                case .requestFailed(let message):
                    errorMessage = message
                case .responseDecodingFailed(let message):
                    errorMessage = message
                case .failedToConnectToServer(let message):
                    errorMessage = message
                case .objectEncodingFailed:
                    errorMessage = "Wrong data!"
                }
                isSavingData = false
                showError = true
            }
        }
    }
}

struct AddBidView_Previews: PreviewProvider {
    static var previews: some View {
        AddBidView(showAddBid: .constant(true))
            .environmentObject(UserViewModel())
            .environmentObject(NFTViewModel())
    }
}
