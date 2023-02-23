//
//  WelcomeTextView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 23.02.23.
//

import SwiftUI

struct WelcomeTextView: View {
  let text: String
  
  var body: some View {
    Text(text)
      .font(.title)
      .fontWeight(.semibold)
      .foregroundColor(Color(Constants.Colors.primaryText))
      .multilineTextAlignment(.center)
  }
}
struct WelcomeTextView_Previews: PreviewProvider {
    static var previews: some View {
      WelcomeTextView(text: "Welcome")
    }
}
