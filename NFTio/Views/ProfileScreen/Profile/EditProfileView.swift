//
//  EditProfileView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 30.04.23.
//

import SwiftUI

struct EditProfileView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var viewModel: UserViewModel
    
    @State var username: String = ""
    @State var email: String = ""
    @State var wallet: Wallet = .unknown
    @State var walletAddress: String = ""
    
    @State var errorMessage: String = ""
    @State var isSaving: Bool = false
    
    var body: some View {
        ZStack(
            alignment: Alignment(horizontal: .center, vertical: .top)
        ) {
            Color(uiColor: .secondarySystemBackground)
                .edgesIgnoringSafeArea(.all)
            
            Form {
                Section {
                    HStack {
                        Spacer()
                        UserAvatarView()
                        Spacer()
                    }
                }
                .listRowBackground(Color.clear)
                
                Section(header: Text("User Details")) {
                    TextField("",
                              text: $username,
                              prompt: Text("Username")
                        .foregroundColor(Color(Constants.Colors.primaryText)))
                    TextField("",
                              text: $email,
                              prompt: Text("Email")
                        .foregroundColor(Color(Constants.Colors.primaryText)))
                }
                
                Section(header: Text("Payment Info")) {
                    // Currency
                    Picker("Wallet", selection: $wallet) {
                        ForEach(Wallet.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    TextField("",
                              text: $walletAddress,
                              prompt: Text("Wallet Address")
                        .foregroundColor(Color(Constants.Colors.primaryText)))
                }
               
                if !errorMessage.isEmpty {
                    Section(header: Text("Error")) {
                       Text(errorMessage)
                            .foregroundColor(.red)
                    }
                    .listRowBackground(Color.clear)
                }
                
                Button {
                    errorMessage = ""
                    Task {
                        await saveUser()
                    }
                } label: {
                    ButtonIconView(
                        buttonText: isSaving ?
                        "Saving ..." :
                            Constants.Text.Auth.editButtonLabel,
                        buttonTextColor: Constants.Colors.darkYellow,
                        buttonBackgroundColor: Constants.Colors.charcoal,
                        iconName: Constants.Text.AddNFT.buttonIcon
                    )
                }
                .disabled(isSaving)
                .listRowBackground(Color.clear)
            }
            .frame(maxWidth: 400)
            .background(Color.clear)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(
                    placement: .navigationBarLeading
                ) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: Constants.Text.IconNames.arrowBack)
                            .foregroundColor(Color(Constants.Colors.primaryText))
                    }
                    
                }
                ToolbarItem(placement: .principal) {
                    HStack {
                        Spacer()
                        Text(Constants.Text.Auth.editTitle)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(Constants.Colors.secondary))
                        Spacer()
                    }
                    .padding(.leading, -Constants.Spacing.xxlarge)
                }
            }
            .padding(.horizontal)
        }
        .onAppear {
            if let user = viewModel.user {
                username = user.username
                email = user.email
                
                if let currentWallet = user.wallet {
                    wallet = currentWallet
                }
                
                if let currentWalletAddress = user.walletAddress {
                    walletAddress = currentWalletAddress
                }
            }
        }
    }
    
    private func saveUser() async {
        isSaving = true
        defer {
            isSaving = false
        }
        
        do {
            viewModel.user?.username = username
            viewModel.user?.email = email
            viewModel.user?.wallet = wallet
            viewModel.user?.walletAddress = walletAddress
            
            try await viewModel.updateUser()
            
            dismiss()
        } catch let error {
            errorMessage = error.localizedDescription
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
            .environmentObject(UserViewModel())
    }
}
