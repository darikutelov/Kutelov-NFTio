//
//  CheckoutItemListView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 5.03.23.
//

import SwiftUI

struct CheckoutItemListView: View {
    var checkoutItems: [ShoppingCartDataManager.ShoppingCartItem]
    let columns = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView(.vertical,
                   showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(checkoutItems, id: \.self.nftItem.id) {
                    CheckoutItemCellView(checkoutItem: $0)
                }
            }
        }
    }
}

struct CheckoutItemListView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutItemListView(checkoutItems: ShoppingCartDataManager().shoppingCartItems)
    }
}