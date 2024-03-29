//
//  CheckoutItemListView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct CheckoutItemListView: View {
    var checkoutItems: [ShoppingCartItem]
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(checkoutItems, id: \.self.nftItem.id) {
                CartItemCellView(shoppingCartItem: $0)
                    .padding()
                    .background(Color(Constants.Colors.cardBackground))
                    .cornerRadius(Constants.General.standardCornerRadius)
            }
        }
    }
}

struct CheckoutItemListView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutItemListView(checkoutItems: ShoppingCartDataManager().shoppingCartItems)
    }
}
