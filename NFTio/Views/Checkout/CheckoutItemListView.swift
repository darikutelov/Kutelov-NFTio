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
                ShoppingCartItemCellView(shoppingCartItem: $0)
            }
        }
    }
}

struct CheckoutItemListView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutItemListView(checkoutItems: ShoppingCartDataManager().shoppingCartItems)
    }
}
