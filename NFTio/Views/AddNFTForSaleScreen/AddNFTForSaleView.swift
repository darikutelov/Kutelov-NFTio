//
//  AddNFTForSaleView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import SwiftUI

struct AddNFTForSaleView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State var isLoginScreenOpen = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(uiColor: .secondarySystemBackground)
                VStack {
                    Spacer()
                        .frame(height: Constants.Spacing.superLarge)
                    NFTFormView()
                }
            }
            .edgesIgnoringSafeArea(.all)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Spacer()
                        Text(Constants.Text.AddNFT.title)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(Constants.Colors.secondary))
                        Spacer()
                    }
                    .padding(.trailing, -Constants.Spacing.xlarge)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if userViewModel.user != nil {
                            userViewModel.logoutUser()
                        } else {
                            isLoginScreenOpen = true
                        }
                        
                    } label: {
                        Image(
                            systemName: userViewModel.user != nil ?
                            Constants.Text.IconNames.togglePower :
                                Constants.Text.IconNames.person
                        )
                        .foregroundColor(Color(Constants.Colors.primaryText))
                    }
                }
            }
            .fullScreenCover(isPresented: $isLoginScreenOpen) {
                AuthScreen(isPresented: $isLoginScreenOpen)
            }
        }
    }
}

struct AddNFTForSaleView_Previews: PreviewProvider {
    static var previews: some View {
        AddNFTForSaleView()
            .environmentObject(UserViewModel())
    }
}
