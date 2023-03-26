//
//  Collection.swift
//  NFTio
//
//  Created by Dariy Kutelov on 3.03.23.
//

import Foundation

/// Data structure to represent NFT collection
struct NFTCollection: Hashable, Identifiable {
    let id: String
    let name: String
    var description: String?
    var imageUrl: String?
    let contractAddress: String
    var numberOfItems: Int
    let createdAt: Date
    let category: Category
    let totalVolume: Int
    var floorPrice: Decimal
    let owners: Int
}

let categoryStore = CategoryStore()

extension NFTCollection {
    static var collections: [NFTCollection] = [
        NFTCollection(
            id: "1",
            name: "The Real Vision Collective",
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
        NFTCollection(
            id: "2",
            name: "Bored Ape Yacht Club",
            description: "The Bored Ape Yacht Club is a collection of 10,000 unique Bored Ape NFTs— unique digital collectibles living on the Ethereum blockchain. Your Bored Ape doubles as your Yacht Club membership card, and grants access to members-only benefits, the first of which is access to THE BATHROOM, a collaborative graffiti board. Future areas and perks can be unlocked by the community through roadmap activation. Visit www.BoredApeYachtClub.com for more details.",
            imageUrl: "bayc.jpeg",
            contractAddress: "0xea47b64e1bfccb773a0420247c0aa0a3c1d2e5c5",
            numberOfItems: 9998,
            createdAt: "2021-04-01T12:00:00.000Z".getDateFromString(),
            category: categoryStore.getCategoryByCategoryName(name: .art)!,
            totalVolume: 890277,
            floorPrice: 68.86,
            owners: 5888
        ),
        NFTCollection(
            id: "3",
            name: "Pukenza",
            description: "Pukenza (also known as Rainbow over the Flow Field), inspired by Tyler Hobb's Fidenza, uses similar concepts combined with Doodles' color palette to create aesthetically soothing generative art. Funded by Doodlebank and created by L3xc from Art Foundry.",
            imageUrl: "pukenza.png",
            contractAddress: "0xea47b64e1bfccb773a0420247c0aa0a3c1d2e5c5",
            numberOfItems: 8010,
            createdAt: "2021-12-01T12:00:00.000Z".getDateFromString(),
            category: categoryStore.getCategoryByCategoryName(name: .art)!,
            totalVolume: 831,
            floorPrice: 0.03,
            owners: 3466
        ),
        NFTCollection(
            id: "4",
            name: "ChillTuna",
            description: "Chill Tuna is a collection of 5,000 utility-enabled NFT with a doomsday-saving background. Chill Tuna aims to create a community for web3 adventurers and builders through ongoing storytelling, interactive designs and long-term value.\n\nLet’s party amidst the chaos; let’s toast to the looming darkness; let’s fight even if it’s the end of light. Just remember… Do not go gentle into that dark night, Fighting, fighting against the dying of the light...",
            imageUrl: "chilltuna.png",
            contractAddress: "0xea47b64e1bfccb773a0420247c0aa0a3c1d2e5c5",
            numberOfItems: 5000,
            createdAt: "2022-11-01T12:00:00.000Z".getDateFromString(),
            category: categoryStore.getCategoryByCategoryName(name: .virtualWorlds)!,
            totalVolume: 651,
            floorPrice: 0.0298,
            owners: 1006
        ),
        NFTCollection(
            id: "5",
            name: "Azuki",
            description: "Take the red bean to join the garden. View the collection at azuki.com/gallery.Azuki starts with a collection of 10,000 avatars that give you membership access to The Garden: a corner of the internet where artists, builders, and web3 enthusiasts meet to create a decentralized future. Azuki holders receive access to exclusive drops, experiences, and more. Visit azuki.com for more details.We rise together. We build together. We grow together.",
            imageUrl: "azuki.png",
            contractAddress: "0xea47b64e1bfccb773a0420247c0aa0a3c1d2e5c5",
            numberOfItems: 10000,
            createdAt: "2022-01-01T12:00:00.000Z".getDateFromString(),
            category: categoryStore.getCategoryByCategoryName(name: .virtualWorlds)!,
            totalVolume: 432888,
            floorPrice: 14.3,
            owners: 4910
        )
        
    ].sorted {
        $0.totalVolume > $1.totalVolume
    }
}
