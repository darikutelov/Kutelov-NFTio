//
//  Collection.swift
//  NFTio
//
//  Created by Dariy Kutelov on 3.03.23.
//

import Foundation

/// Data structure to represent NFT collection
struct Collection: Hashable, Identifiable {
    let id: String
    let collectionName: String
    let description: String
    let imageUrl: String
    let contractAddress: String
    var numberOfItems: Int
    let createdAt: Date
    let category: Category
    let totalVolume: Int
    let floorPrice: Decimal
    let owners: Int
}

let categoryStore = CategoryStore()

extension Collection {
    static let collections: [Collection] = [
        Collection(
            id: "1",
            collectionName: "The Real Vision Collective",
            description: "The Real Vision Collective NFT is your key to the super community of communities. Our goal is to unite Web3 into a single, cohesive community by partnering with some of the biggest and brightest NFT projects around.\n\nIt doesn’t matter whether you’re a true degen, a serious collector, in it for the tech, or just crypto curious — We are building a place for you to learn, grow, hangout and have fun, while driving the Web3 revolution forward.\n\nWelcome to the Real Vision Collective.Let’s build something extraordinary…!",
            imageUrl: "real-vision.png",
            contractAddress: "0x4344cb95bCb0d9e7296D0DE2ff329Bfc8D0A84fe",
            numberOfItems: 5969,
            createdAt: "2023-02-01T12:00:00.000Z".getDateFromString(),
            category: categoryStore.getCategoryByCategoryName(name: .memberships)!,
            totalVolume: 313,
            floorPrice: 0.24,
            owners: 3474
        ),
        Collection(
            id: "2",
            collectionName: "Bored Ape Yacht Club",
            description: "The Bored Ape Yacht Club is a collection of 10,000 unique Bored Ape NFTs— unique digital collectibles living on the Ethereum blockchain. Your Bored Ape doubles as your Yacht Club membership card, and grants access to members-only benefits, the first of which is access to THE BATHROOM, a collaborative graffiti board. Future areas and perks can be unlocked by the community through roadmap activation. Visit www.BoredApeYachtClub.com for more details.",
            imageUrl: "bayc.jpeg",
            contractAddress: "0xea47b64e1bfccb773a0420247c0aa0a3c1d2e5c5",
            numberOfItems: 9998,
            createdAt: "2021-04-01T12:00:00.000Z".getDateFromString(),
            category: categoryStore.getCategoryByCategoryName(name: .art)!,
            totalVolume: 890277,
            floorPrice: 68.86,
            owners: 5888
        )
    ].sorted {
        $0.totalVolume > $1.totalVolume
    }
}
