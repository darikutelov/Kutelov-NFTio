//
//  NFTDataManager.swift
//  NFTio
//
//  Created by Dariy Kutelov on 3.03.23.
//

import Foundation

final class NFTDataManager {
    var nftItems = [NFT]()
    
    init() {
        demoNFT.forEach {
            addNew(nftItem: $0)
        }
    }
    
    
    func addNew(nftItem: NFT) {
        self.nftItems.append(nftItem)
    }
}


//Collection
var collection1 = Collection(
    collectionName: "Bored Ape Yacht Club",
    description: "The Bored Ape Yacht Club is a collection of 10,000 unique Bored Ape NFTs— unique digital collectibles living on the Ethereum blockchain. Your Bored Ape doubles as your Yacht Club membership card, and grants access to members-only benefits, the first of which is access to THE BATHROOM, a collaborative graffiti board. Future areas and perks can be unlocked by the community through roadmap activation. Visit www.BoredApeYachtClub.com for more details.",
    imageUrl: "https://i.seadn.io/gae/lHexKRMpw-aoSyB1WdFBff5yfANLReFxHzt1DOj_sg7mS14yARpuvYcUtsyyx-Nkpk6WTcUPFoG53VnLJezYi8hAs0OxNZwlw6Y-dmI?auto=format&w=3840",
    contractAddress: "0xea47b64e1bfccb773a0420247c0aa0a3c1d2e5c5",
    numberOfItems: 9998,
    createdAt: "2021-04-01T12:00:00.000Z".getDateFromString(),
    category: .art,
    totalVolume: 890277,
    floorPrice: 68.86,
    owners: 5888
)


//Users
let user1 = User(username: "userOne", avatarUrl: "", walletAddress: "")
let user2 = User(username: "userTwo", avatarUrl: "", walletAddress: "")
let user3 = User(username: "userThree", avatarUrl: "", walletAddress: "")

//Bids
let bid1 = Bid(id: "", price: Price(cryptoCurrency: .ethereum, priceInCryptoCurrency: 65.49), user: user1, date: Date.now)
let bid2 = Bid(id: "", price: Price(cryptoCurrency: .ethereum, priceInCryptoCurrency: 66.01), user: user2, date: Date.now)
let bid3 = Bid(id: "", price: Price(cryptoCurrency: .ethereum, priceInCryptoCurrency: 66.03), user: user3, date: Date.now)

let demoNFT = [NFT(
    id: "3479",
    tokenName: "#3479",
    description: "The Bored Ape Yacht Club is a collection of 10,000 unique Bored Ape NFTs— unique digital collectibles living on the Ethereum blockchain.",
    imageUrl: "https://i.seadn.io/gae/v4CjskuHJt0F_exzLeoIxlZqctqu6TbzFU1kUV9-dH7zHAPUH8K9P_cZyFFmcAlUc1aT4JjkvRVdwQpwjTR34L8XsNxD5lvh922w?auto=format&w=1000",
    likes: 29,
    creator: "YugaLabs",
    category: .art,
    collection: collection1,
    contractAddress:"0xd4307e0acd12cf46fd6cf93bc264f5d5d1598792",
    price: Price(
        cryptoCurrency: .ethereum,
        priceInCryptoCurrency: 67.452345)
    ,
    quantity: 1,
    auctionExpiryDate: "2023-02-28T12:00:00.000Z".getDateFromString(),
    bids: [bid1, bid2]
), NFT(
    id: "9760",
    tokenName: "#9760",
    description: nil,
    imageUrl: "https://i.seadn.io/gae/JvfjXuTz7Kxgj-FeITNEjzto2kuNr690OLYDWWFSrJ4S30D7GR2-X0EglRPxyoVJKLbaurORsrxGOFeUDXhCsm7MtzwK_K9K3RnNxaQ?auto=format&w=1000",
    likes: 37,
    creator: "YugaLabs",
    category: .art,
    collection: collection1,
    contractAddress:"0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D",
    price: Price(
        cryptoCurrency: .ethereum,
        priceInCryptoCurrency: 67.4012)
    ,
    quantity: 1,
    auctionExpiryDate: "2023-02-28T12:00:00.000Z".getDateFromString(),
    bids: [bid2, bid3]
), NFT(
    id: "4165",
    tokenName: "#4165",
    description: nil,
    imageUrl: "https://i.seadn.io/gae/-706iQmTnV6N7aqbCj5MGpHsEvrBknwpBjoVJFjbPogUUar0wjpsLp2wlxIvcGZjAFmZKtcz-2j510MfR9P0H_NeBDJ3xaqrTUPdaxo?auto=format&w=1000",
    likes: 34,
    creator: "YugaLabs",
    category: .art,
    collection: collection1,
    contractAddress:"0xbc4ca0eda7647a8ab7c2061c2e118a18a936f13d",
    price: Price(
        cryptoCurrency: .ethereum,
        priceInCryptoCurrency: 67.4201)
    ,
    quantity: 1,
    auctionExpiryDate: "2023-02-28T12:00:00.000Z".getDateFromString(),
    bids: [bid1, bid3]
), NFT(
    id: "9703",
    tokenName: "#9703",
    description: "The Bored Ape Yacht Club is a collection of 10,000 unique Bored Ape NFTs— unique digital collectibles living on the Ethereum blockchain.",
    imageUrl: "https://i.seadn.io/gae/0YflX-YXzFapvdTa-waESblOV9AuGqm1iKVEPDxzyekbOhSupCvuNahwKulrVrkQUvW2xN4sw30bnvSHnUcszRIZJzq2P7z19JK-aLU?auto=format&w=3840",
    likes: 34,
    creator: "YugaLabs",
    category: .art,
    collection: collection1,
    contractAddress:"0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D",
    price: Price(
        cryptoCurrency: .ethereum,
        priceInCryptoCurrency: 75.4323)
    ,
    quantity: 1,
    auctionExpiryDate: "2023-02-28T12:00:00.000Z".getDateFromString(),
    bids: [bid1, bid3]
), NFT(
    id: "6987",
    tokenName: "#6987",
    description: "The Bored Ape Yacht Club is a collection of 10,000 unique Bored Ape NFTs— unique digital collectibles living on the Ethereum blockchain.",
    imageUrl: "https://i.seadn.io/gae/MrrzxdlB4u0-7CrC4pKakSuCkhqU834l1qen6HI0MdLZzzGCkt5KdSMrxavl3vOb1uYEabR_wwhGUxtQM0g3xlcU7GgSCpkg-3J4_A?auto=format&w=3840",
    likes: 25,
    creator: "YugaLabs",
    category: .art,
    collection: collection1,
    contractAddress:"0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D",
    price: Price(
        cryptoCurrency: .ethereum,
        priceInCryptoCurrency: 75.4532)
    ,
    quantity: 1,
    auctionExpiryDate: "2023-02-28T12:00:00.000Z".getDateFromString(),
    bids: [bid1, bid2]
), NFT(
    id: "1353",
    tokenName: "#1353",
    description: "The Bored Ape Yacht Club is a collection of 10,000 unique Bored Ape NFTs— unique digital collectibles living on the Ethereum blockchain.",
    imageUrl: "https://i.seadn.io/gae/7YZf35HGBGQjf34S6qlNDQRlvQ02qn0Wnrk-d7JR336wCy--KaltTk-X8PrOLqJa1zY8zW0kT4vzVx0ODxfgj74bTZ6N8ltl0_asK3M?auto=format&w=3840",
    likes: 21,
    creator: "YugaLabs",
    category: .art,
    collection: collection1,
    contractAddress:"0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D",
    price: Price(
        cryptoCurrency: .ethereum,
        priceInCryptoCurrency: 75.1)
    ,
    quantity: 1,
    auctionExpiryDate: "2023-02-28T12:00:00.000Z".getDateFromString(),
    bids: [bid2, bid3]
)]
