//
//  NoNetworkView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 25.04.23.
//

import SwiftUI

struct ErrorNotificationView: View {
    @EnvironmentObject var nftViewModel: NFTViewModel
    
    let errorMessage: String
    
    var body: some View {
        VStack {
            Image(systemName: "wifi.slash")
                .resizable()
                .scaledToFill()
                .foregroundColor(Color(Constants.Colors.primary))
                .frame(width: Constants.Spacing.xxxlarge,
                       height: Constants.Spacing.xxxlarge)
                .padding(.bottom, Constants.Spacing.standard)
            Text(errorMessage)
                .foregroundColor(Color(Constants.Colors.primary))
                .padding(.all, Constants.Spacing.xxlarge)
                .multilineTextAlignment(.center)
        }
    }
}

struct NoNetworkNotificationView: View {
    @Binding var showNetworkAlert: Bool
    let errorMessage: String
    
    var body: some View {
        VStack {
            Image(systemName: "wifi.slash")
                .resizable()
                .scaledToFill()
                .foregroundColor(Color(Constants.Colors.primary))
                .frame(width: Constants.Spacing.xxxlarge,
                       height: Constants.Spacing.xxxlarge)
                .padding(.bottom, Constants.Spacing.standard)
            Text(errorMessage)
                .foregroundColor(Color(Constants.Colors.primary))
                .padding(.all, Constants.Spacing.xxlarge)
                .multilineTextAlignment(.center)
        }
        .task {
            do {
                try await Task.sleep(nanoseconds: 3_000_000_000)
                
                await MainActor.run {
                    showNetworkAlert = false
                }
            } catch let error {
                print(error)
            }
        }
    }
}

struct ErrorNotificationView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorNotificationView(
            errorMessage: "No internet connection. The data that you see may be outdated.")
    }
}
