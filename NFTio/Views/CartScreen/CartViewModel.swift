//
//  CartViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 17.03.23.
//

import Foundation

@MainActor
final class CartViewModel: ObservableObject {
    @Published var cartItems: [ShoppingCartItem] = ShoppingCartDataManager().shoppingCartItems
    @Published var promoCodeDiscount: PromoCode?
    
    var seasonalDiscount: SeasonalDiscount? = SeasonalDiscount(
        seasonName: "Eastern",
        discountPercentage: 0.05
    )
    
    var cartItemIds: [String] {
        cartItems.map { $0.nftItem.id }
    }
    
    var totalAmount: Decimal {
        cartItems.reduce(0.0) { prev, currentItem in
            prev + currentItem.nftItem.price.priceInCryptoCurrency * Decimal(currentItem.quantity)
        }
    }
    
    var totalAmountAfterDiscount: Decimal? {
        guard let seasonalDiscount = seasonalDiscount else { return nil }
        
        return seasonalDiscount.calculateDiscount(totalAmount: totalAmount)
    }
    
    public func addItemToCart(nft: NFT) {
        guard let itemIndex = findCartItemIndex(nft.id) else {
            cartItems.append(
                ShoppingCartItem(
                    nftItem: nft,
                    quantity: 1
                )
            )
            return
        }
        
        cartItems[itemIndex].quantity += 1
    }
    
    public func removeItemFromCart(shoppingCardItem: ShoppingCartItem) {
        guard let itemIndex = findCartItemIndex(shoppingCardItem.nftItem.id) else {
            return
        }
    
        cartItems.remove(at: itemIndex)
    }
    
    public func reduceItemQuantityInCart(shoppingCardItem: ShoppingCartItem) {
        guard let itemIndex = findCartItemIndex(shoppingCardItem.nftItem.id) else {
            return
        }
    
        guard cartItems[itemIndex].quantity > 1 else {
            return
        }
        
        cartItems[itemIndex].quantity -= 1
    }
    
    private func findCartItemIndex(_ nftId: String) -> Int? {
        if let itemIndex = cartItems.firstIndex(where: { $0.nftItem.id == nftId}) {
            return itemIndex
        }
        return nil
    }
    
    func applyPromoCode(_ promoCode: String) {
        let code = PromoCode(promoCode: promoCode)
        
        guard code.error == nil else {
            return
        }
        
        seasonalDiscount = nil
        promoCodeDiscount = code
    }
}
