//
//  NFTFormView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 24.04.23.
//

import SwiftUI
import Combine

struct NFTFormView: View {
    @EnvironmentObject var nftViewModel: NFTViewModel
    @StateObject var addNFTviewModel = AddNFTViewModel()
    
    // Form Fields
    @State var name: String = ""
    @State var price: String = ""
    @State var bidCurrency: CryptoCurrency = CryptoCurrency.ethereum
    @State var quantity: String = ""
    @State var description: String = ""
    @State var contractAddress: String = ""
    @State var collection: NFTCollection = NFTDataManager().nftCollections[0]
    @State var category: CategoryName = CategoryName.art
    
    // Other props
    @State var errorMessage = ""
    @State var showError = false
    @State var isSavingData = false
    
    var body: some View {
        Form {
            Section(header: Text("NFT image")) {
                EditableUploadImageView(
                    viewModel: addNFTviewModel
                )
                .listRowBackground(Color.clear)
            }
            
            Section(header: Text("NFT name, price and quantity")) {
                TextField("",
                          text: $name,
                          prompt: Text("Name")
                    .foregroundColor(Color(Constants.Colors.primaryText)))
                TextField("",
                          text: $price,
                          prompt: Text("Price")
                    .foregroundColor(Color(Constants.Colors.primaryText)))
                .keyboardType(.numbersAndPunctuation)
                .onReceive(Just(price)) { newValue in
                    let filtered = newValue.filter { "0123456789.".contains($0) }
                    if filtered != newValue {
                        self.price = filtered
                    }
                }
                
                // Currency
                Picker("Currency", selection: $bidCurrency) {
                    ForEach(CryptoCurrency.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                
                // Quantity
                TextField("",
                          text: $quantity,
                          prompt: Text("Quantity")
                    .foregroundColor(Color(Constants.Colors.primaryText)))
                .keyboardType(.numbersAndPunctuation)
                .onReceive(Just(price)) { newValue in
                    let filtered = newValue.filter { "0123456789".contains($0) }
                    if filtered != newValue {
                        self.price = filtered
                    }
                }
            }
            
            Section(header: Text("NFT collection and category")) {
                Picker("Collection", selection: $collection) {
                    ForEach(nftViewModel.nftCollections ?? [NFTCollection](), id: \.self) {
                        Text($0.name).tag($0.id)
                    }
                }
                Picker("Category", selection: $category) {
                    ForEach(CategoryName.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
            }
            
            Section(header: Text("NFT description and contract addresss")) {
                // Description
                TextField("",
                          text: $description,
                          prompt: Text("Description")
                    .foregroundColor(Color(Constants.Colors.primaryText)),
                          axis: .vertical
                )
                .lineLimit(3)
                
                // Contract address
                TextField("",
                          text: $contractAddress,
                          prompt: Text("Contract address")
                    .foregroundColor(Color(Constants.Colors.primaryText)))
            }
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
        .frame(maxWidth: 400)
    }
}

struct NFTFormView_Previews: PreviewProvider {
    static var previews: some View {
            NFTFormView()
                .environmentObject(NFTViewModel())
        }
}
