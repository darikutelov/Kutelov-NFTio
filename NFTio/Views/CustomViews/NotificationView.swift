//
//  NotificationView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 2.05.23.
//

import SwiftUI

struct NotificationView: View {
    @Binding var alertIsVisible: Bool
    let title: String
    let iconName: String
    let message: String
    
    var body: some View {
        VStack(spacing: Constants.Spacing.standard) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.green)
            
            if !iconName.isEmpty {
                Image(systemName: iconName)
                    .font(.system(size: Constants.Spacing.superLarge))
                    .foregroundColor(.green)
            }
            
            Text(message)
                .foregroundColor(
                    Color(Constants.Colors.charcoal).opacity(0.7)
                )
                .padding(.bottom)
            Button {
                withAnimation {
                    alertIsVisible = false
                }
            } label: {
                Text("OK")
                    .font(.body)
                    .foregroundColor(Color(Constants.Colors.darkYellow))
                    .bold()
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(Constants.Colors.charcoal))
                    .cornerRadius(12)
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color(Constants.Colors.white))
        .cornerRadius(Constants.General.roundedRectCornerRadius)
        .shadow(radius: 10, x: 5, y: 5)
        .transition(.scale)
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView(alertIsVisible: .constant(true),
                         title: "Success!",
                         iconName: "checkmark.circle.fill",
                         message: "Your purchase is complete!")
    }
}
