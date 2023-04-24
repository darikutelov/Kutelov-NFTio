//
//  NFTFormView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 24.04.23.
//

import SwiftUI
import Combine

struct NFTFormView: View {
    // Form Fields
    @State var name: String = ""
    @State var price: String = ""
    @State var bidCurrency: CryptoCurrency = CryptoCurrency.ethereum
    @State var quantity: String = ""
    @State var description: String = ""
    @State var contractAddress: String = ""
    // Other props
    @State var errorMessage = ""
    @State var showError = false
    @State var isSavingData = false
    
    var body: some View {
        VStack {
            Text("Image")
            // Name
            TextField("", text: $name, prompt: Text("Name")
                .foregroundColor(Color(Constants.Colors.secondary)))
            .modifier(StandardInputField(error: !errorMessage.isEmpty))
            .padding(.bottom, Constants.Spacing.small)
            
            // Price
            TextField("",
                      text: $price,
                      prompt: Text("Price")
                .foregroundColor(Color(Constants.Colors.secondary)))
            .keyboardType(.numbersAndPunctuation)
            .onReceive(Just(price)) { newValue in
                let filtered = newValue.filter { "0123456789.".contains($0) }
                if filtered != newValue {
                    self.price = filtered
                }
            }
            .modifier(StandardInputField(error: !errorMessage.isEmpty))
            .padding(.bottom, Constants.Spacing.small)
            
            // Currency
            Picker("Currency", selection: $bidCurrency) {
                ForEach(CryptoCurrency.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .frame(maxWidth: 400.0, minHeight: 50.0)
            .background(
                RoundedRectangle(
                    cornerRadius: Constants.General.standardCornerRadius)
                .fill(Color(.white).opacity(0.9))
            )
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.standardCornerRadius)
                    .stroke(Color(Constants.Colors.secondary), lineWidth: 1.0)
            )
            .padding(.bottom, Constants.Spacing.small)
            
            // Quantity
            TextField("",
                      text: $quantity,
                      prompt: Text("Quantity")
                .foregroundColor(Color(Constants.Colors.secondary)))
            .keyboardType(.numbersAndPunctuation)
            .onReceive(Just(price)) { newValue in
                let filtered = newValue.filter { "0123456789".contains($0) }
                if filtered != newValue {
                    self.price = filtered
                }
            }
            .modifier(StandardInputField(error: !errorMessage.isEmpty))
            .padding(.bottom, Constants.Spacing.small)
            
            Text("Collection")
            Text("Category")
            
            // Description
            TextField("",
                      text: $description,
                      prompt: Text("Description")
                        .foregroundColor(Color(Constants.Colors.secondary)),
                      axis: .vertical
            )
            .lineLimit(3)
            .modifier(StandardInputField(error: !errorMessage.isEmpty))
            .padding(.bottom, Constants.Spacing.small)
            
            // Contract address
            TextField("",
                      text: $contractAddress,
                      prompt: Text("Contract address")
                        .foregroundColor(Color(Constants.Colors.secondary)))
            .modifier(StandardInputField(error: !errorMessage.isEmpty))
            .padding(.bottom, Constants.Spacing.small)
            
            Button {
                print("Add Nft")
            } label: {
                ButtonIconView(
                    buttonText: isSavingData ?
                    "Saving ..." :
                        Constants.Text.AddNFT.buttonLabel,
                    buttonTextColor: Constants.Colors.white,
                    buttonBackgroundColor: Constants.Colors.primary,
                    iconName: Constants.Text.AddNFT.buttonIcon
                )
            }
            .disabled(isSavingData)
        }
        .padding()
    }
}

struct NFTFormView_Previews: PreviewProvider {
    static var previews: some View {
        NFTFormView()
    }
}
