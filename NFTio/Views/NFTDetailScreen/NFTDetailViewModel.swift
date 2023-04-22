//
//  NFTDetailViewModel.swift
//  NFTio
//
//  Created by Dariy Kutelov on 22.04.23.
//

import SwiftUI

final class NFTDetailViewModel: ObservableObject {
    
    @Published var nft: NFT?
    @Published var errorMessage: String?
    var nftViewModel: NFTViewModel?
    
    init(nft: NFT, nftViewModel: NFTViewModel?) {
        self.nft = nft
        self.errorMessage = ""
        self.nftViewModel = nftViewModel
    }
    
    public func addBid(with price: Decimal,
                       in currency: CryptoCurrency,
                       for user: User) {
        
        guard let nftId = nft?.id else { return }
        
        let requestUrl = RequestUrl(
            endpoint: .nftItems,
            pathComponents: [nftId, "bids"]
        )
        
        let bid = Bid(
            id: nil,
            price: Price(cryptoCurrency: currency,
                         priceInCryptoCurrency: price),
            user: user,
            date: nil)
        
        Task {
            do {
                let createdBid = try await APIService.shared.saveData(
                    requestUrl,
                    bodyData: bid
                )
                
                guard let bid = createdBid else { return }
                
                await MainActor.run {
                    if var updatedNFT = self.nft {
                        updatedNFT.addBid(bid)
                        nftViewModel?.updateNFTItems(updatedNFT)
                        
                        self.nft = updatedNFT
                    }
                }
                
                
            } catch let error {
                print(error)
                errorMessage = "Error!"
            }
        }
    }
}
