//
//  ContentView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.02.23.
//

import SwiftUI

struct ContentView: View {
  @State private var user = User()
  
  var body: some View {
    if user.isAuthenticated {
      HomeScreenView(user: $user)
    } else {
      //LoginScreenView()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
