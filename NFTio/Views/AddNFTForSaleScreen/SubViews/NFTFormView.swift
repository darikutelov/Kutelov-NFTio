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
    @EnvironmentObject var userViewModel: UserViewModel
    @StateObject var addNFTviewModel = AddNFTViewModel()
    
    // Form Fields
    @State var name: String = "#8475"
    @State var price: String = "0.1315"
    @State var bidCurrency: CryptoCurrency = CryptoCurrency.ethereum
    @State var quantity: String = "1"
    @State var description: String = "WonderPals is a collection of 10,000 delightfully cute pals. Our vision is to bring more joy to the world through community, creativity, and fun art"
    @State var contractAddress: String = "0x3Acce66cD37518A6d77d9ea3039E00B3A2955460"
    @State var collection: NFTCollection = NFTDataManager().nftCollections[2]
    @State var category: CategoryName = CategoryName.pfps
    
    // Other props
    @State var showError = false
    @State var errorMessage = ""
    @State var isSavingData = false
    
    var body: some View {
        ZStack {
            VStack {
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
                        .onReceive(Just(quantity)) { newValue in
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
                        errorMessage = ""
                        saveNFT()
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
                .alert(isPresented: $showError) {
                    Alert(
                        title: Text("Error!"),
                        message: Text("\(errorMessage)"),
                        dismissButton: .default(Text("OK")))
                }
                Spacer()
                    .frame(height: Constants.Spacing.xxlarge)
            }
            if isSavingData {
                ProgressView() .frame(maxWidth: .infinity, maxHeight: .infinity) .background(.gray.opacity(0.4))
            }
        }
    }
    
    private func saveNFT() {
        let isValid = validate()
        guard isValid else { return }
        
        guard let nftPrice = Decimal(string: price),
              let nftQuantity = Int(quantity) else {
                  errorMessage = "Invalid price or quantity."
                  showError = true
                  return
              }
        
        guard let nftCategory = nftViewModel.categories.first(where: { $0.name == category}) else {
            errorMessage = "Invalid category."
            showError = true
            return
        }
        
        guard let creator = userViewModel.user?.username else {
            errorMessage = "You need to log in to be able to create an NFT."
            showError = true
            return
        }
                
        let nft = NFT(id: "",
                      tokenName: name,
                      description: description,
                      imageUrl: "",
                      likes: 0,
                      creator: creator,
                      category: nftCategory,
                      nftCollection: collection,
                      contractAddress: contractAddress,
                      price: Price(
                        cryptoCurrency: bidCurrency,
                        priceInCryptoCurrency: nftPrice
                      ),
                      quantity: nftQuantity,
                      bids: [])
        Task {
            isSavingData = true
            do {
                try await addNFTviewModel.postNFT(nft: nft)
                await nftViewModel.fetchNftItems()
                isSavingData = false
                resetValues()
            } catch let error {
                isSavingData = false
                errorMessage = error.localizedDescription
                showError = true
            }
        }
    }
    
    private func validate() -> Bool {
        guard let imageFileName = AddNFTViewModel.UploadImage.imageFileName,
              !imageFileName.isEmpty
        else {
            errorMessage = "You need to add image of your NFT."
            showError = true
            return false
        }
        
        guard !name.isEmpty, name.count > 2 else {
            errorMessage = "Name should not be empty and should be min 2 characters."
            showError = true
            return false
        }
        
        return true
    }
    
    private func resetValues() {
        addNFTviewModel.resetImage()
        name = ""
        price = ""
        bidCurrency = .ethereum
        quantity = ""
        description = ""
        contractAddress = ""
        collection = NFTDataManager().nftCollections[0]
        category = .pfps
        showError = false
        errorMessage = ""
    }
}

struct NFTFormView_Previews: PreviewProvider {
    static var previews: some View {
        NFTFormView()
            .environmentObject(NFTViewModel())
            .environmentObject(UserViewModel())
    }
}
