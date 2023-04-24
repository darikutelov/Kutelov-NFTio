//
//  NFTFormView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 24.04.23.
//

import SwiftUI

struct NFTFormView: View {
    @State var isSavingData = false
    
    var body: some View {
        VStack {
            Text("Image")
            Text("Name")
            Text("Price")
            Text("Currency")
            Text("Quantity")
            Text("Collection")
            Text("Category")
            Text("Description")
            Text("Contract address")
            
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
