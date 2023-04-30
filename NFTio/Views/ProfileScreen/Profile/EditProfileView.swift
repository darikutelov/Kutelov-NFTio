//
//  EditProfileView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 30.04.23.
//

import SwiftUI

struct EditProfileView: View {
    @EnvironmentObject var viewModel: UserViewModel
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Spacer()
                    UserAvatarView(viewModel: viewModel)
                    Spacer()
                }
            }
            .listRowBackground(Color.clear)
            
        }
        .background(Color.clear)
    }
}

//try? await viewModel.updateUser()

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
            .environmentObject(UserViewModel())
    }
}
