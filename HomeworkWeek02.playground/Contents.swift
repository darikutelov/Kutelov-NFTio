import Foundation

// MARK: - Models

/// Data Structure to Represent NFT  item for sale
struct NFT {
    let id: String
    let tokenName: String
    let description: String?
    let imageUrl: String
    var likes: Int
    let creator: String
    let category: Category
    let collection: Collection
    let contractAddress: String
    let price: Price
    var quantity: Int
    var auctionExpiryDate: Date
    var bids: [Bid]
}

/// Data structure for price of NFT itme
struct Price {
    let cryptoCurrency: CryptoCurrency
    let priceInCryptoCurrency: Double
}

/// Data structure for a bit in NFT auction
struct Bid {
    let id: String
    let price: Price
    let user: User
    let date: Date
}

/// Data structure to represent a registerd user
struct User {
    let username: String
    let avatarUrl: String
    let walletAddress: String
}

/// Enum for names of NFT items' categories
enum Category: String, CaseIterable {
    case art = "Art"
    case collectibles = "Colectibles"
    case domainNames = "Domain Names"
    case music = "Music"
    case photography = "Photography"
    case sports = "Sports"
    case tradingCards = "Trading Cards"
    case utility = "Utility"
    case virtualWorlds = "Virtual Worlds"
}

/// Enum for allowed crypto currencies
enum CryptoCurrency: String, CaseIterable {
    case ethereum = "ETH"
    case dai = "DAI"
    case basicAttentionToken = "BAT"
    case ash = "ASH"
    case cube = "CUBE"
}

/// Data structure to represent NFT collection
struct Collection {
    let collectionName: String
    let description: String
    let imageUrl: String
    let contractAddress: String
    var numberOfItems: Int
    let createdAt: Date
    let category: Category
    let totalVolume: Int
    let floorPrice: Double
    let owners: Int
    var nftItems: [NFT] = []
}

// MARK: - Instances

// Initialize emty NFT collection
var nftItems = [NFT]()

// Set DateFormatter to parse date in format "2023-02-24T12:25:35.000Z"
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

//Users
let user1 = User(username: "userOne", avatarUrl: "", walletAddress: "")
let user2 = User(username: "userTwo", avatarUrl: "", walletAddress: "")
let user3 = User(username: "userThree", avatarUrl: "", walletAddress: "")


//Bids
let bid1 = Bid(id: "", price: Price(cryptoCurrency: .ethereum, priceInCryptoCurrency: 65.49), user: user1, date: Date.now)
let bid2 = Bid(id: "", price: Price(cryptoCurrency: .ethereum, priceInCryptoCurrency: 66.01), user: user2, date: Date.now)
let bid3 = Bid(id: "", price: Price(cryptoCurrency: .ethereum, priceInCryptoCurrency: 66.03), user: user3, date: Date.now)

//Collection
var collection1 = Collection(
    collectionName: "Bored Ape Yacht Club",
    description: "The Bored Ape Yacht Club is a collection of 10,000 unique Bored Ape NFTs— unique digital collectibles living on the Ethereum blockchain. Your Bored Ape doubles as your Yacht Club membership card, and grants access to members-only benefits, the first of which is access to THE BATHROOM, a collaborative graffiti board. Future areas and perks can be unlocked by the community through roadmap activation. Visit www.BoredApeYachtClub.com for more details.",
    imageUrl: "https://i.seadn.io/gae/lHexKRMpw-aoSyB1WdFBff5yfANLReFxHzt1DOj_sg7mS14yARpuvYcUtsyyx-Nkpk6WTcUPFoG53VnLJezYi8hAs0OxNZwlw6Y-dmI?auto=format&w=3840",
    contractAddress: "0xea47b64e1bfccb773a0420247c0aa0a3c1d2e5c5",
    numberOfItems: 9998,
    createdAt: dateFormatter.date(from: "2021-04-01T12:00:00.000Z") ?? Date.now,
    category: .art,
    totalVolume: 890277,
    floorPrice: 68.86,
    owners: 5888
)

let nft1 = NFT(
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
        priceInCryptoCurrency: 67.45)
    ,
    quantity: 1,
    auctionExpiryDate:  dateFormatter.date(from: "2023-02-28T12:00:00.000Z") ?? Date.now,
    bids: [bid1, bid2]
)

let nft2 = NFT(
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
        priceInCryptoCurrency: 67.401)
    ,
    quantity: 1,
    auctionExpiryDate:  dateFormatter.date(from: "2023-02-28T12:00:00.000Z") ?? Date.now,
    bids: [bid2, bid3]
)

let nft3 = NFT(
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
        priceInCryptoCurrency: 67.401)
    ,
    quantity: 1,
    auctionExpiryDate:  dateFormatter.date(from: "2023-02-28T12:00:00.000Z") ?? Date.now,
    bids: [bid1, bid3]
)

let nft4 = NFT(
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
        priceInCryptoCurrency: 75)
    ,
    quantity: 1,
    auctionExpiryDate:  dateFormatter.date(from: "2023-02-28T12:00:00.000Z") ?? Date.now,
    bids: [bid1, bid3]
)

let nft5 = NFT(
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
        priceInCryptoCurrency: 75.45)
    ,
    quantity: 1,
    auctionExpiryDate:  dateFormatter.date(from: "2023-02-28T12:00:00.000Z") ?? Date.now,
    bids: [bid1, bid2]
)

let nft6 = NFT(
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
        priceInCryptoCurrency: 75)
    ,
    quantity: 1,
    auctionExpiryDate:  dateFormatter.date(from: "2023-02-28T12:00:00.000Z") ?? Date.now,
    bids: [bid2, bid3]
)


collection1.nftItems.append(nft1)
collection1.nftItems.append(nft2)
collection1.nftItems.append(nft3)
collection1.nftItems.append(nft4)
collection1.nftItems.append(nft5)
collection1.nftItems.append(nft6)

// MARK: - Functions


/// Adds new item to a NFT collection
/// - Parameter nftItem: NFT to add
func addNew(nftItem: NFT) {
    nftItems.append(nftItem)
}

addNew(nftItem: nft1)
addNew(nftItem: nft2)
addNew(nftItem: nft3)
addNew(nftItem: nft4)
addNew(nftItem: nft5)
addNew(nftItem: nft6)


/// Prints all NFT items from a NFT collection if optional property description is not nil
/// - Parameter nftItems: collection of NFT items
func printNFTitems(_ nftItems: [NFT]) {
    for item in nftItems where item.description != nil {
        if let nftString = nftToString(item) {
            print(nftString)
        }
    }
}

/// Creates string representation of NFT item
/// - Parameter nft: NFT item
/// - Returns: String with properties'  names and values of NFT or nil
func nftToString(_ nft: NFT) -> String? {
    guard let description = nft.description else { return nil }
    
    let bids = nft.bids.map {
        "- id:\($0.id), date:\($0.date), price: \($0.price.cryptoCurrency.rawValue) \($0.price.priceInCryptoCurrency), bidder: \($0.user.username)"
    }
        .joined(separator: "\n")
    
    return """
      ---
      id: \(nft.id)
      name: \(nft.tokenName)
      description: \(description)
      imageUrl: \(nft.imageUrl)
      likes: \(nft.likes)
      creator: \(nft.creator)
      category: \(nft.category.rawValue)
      collection: \(nft.collection.collectionName)
      contractAddress: \(nft.contractAddress)
      price: \(nft.price.priceInCryptoCurrency) \(nft.price.cryptoCurrency.rawValue)
      quantity: \(nft.quantity)
      auctionExpiryDate: \(nft.auctionExpiryDate)
      bids:
      \(bids)
      """
}

printNFTitems(nftItems)


