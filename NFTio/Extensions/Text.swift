//
//  Constants.swift
//  NFTio
//
//  Created by Dariy Kutelov on 23.02.23.
//

import Foundation

extension Constants {
    // swiftlint:disable all
    enum Text {
        enum General {
            public static let loading = "Loading ..."
        }
        enum Home {
            public static let welcome = String(localized: "Welcome!", comment: "Welcome message on home screen")
            public static let categoriesLabel = "Categories"
            public static let collectionsLabel = "Collections"
            public static let volumeLabel = "Price"
            public static let seeAllLabel = "See All"
            public static let nftListLabel = "Popular NFTs"
            public static let nftItems = "NFT Itmes"
            public static let featuredAuction = "Featured NFT Auction"
            public static let listedPrice = "Price"
            public static let bestBidPrice = "Best bid"
        }
        enum NFTItems {
            public static let nftItems = "NFT Itmes"
        }
        enum IconNames {
            public static let arrowBack = "arrow.backward"
            public static let person = "person"
            public static let personFilled = "person.fill"
            public static let togglePower = "togglepower"
            public static let pencilIcon = "pencil.circle.fill"
            public static let squarePencilIcon = "square.and.pencil"
            public static let dolarSignSquare = "dollarsign.square"
        }
        enum LaunchScreen {
            public static let appIcon = "app-icon"
            public static let headline = "Explore the World of NFTs"
            public static let hasSeenWelcomeScreen = "hasSeenWelcomeScreen"
        }
        enum SearchScreen {
            public static let searchLabel = "NFT name"
            public static let priceLabel = "Price"
        }
        enum TabView {
            public static let userdefaultsKey = "HomeScreenCurrentTab"
            public static let homeIcon = "house"
            public static let homeLabel = "Home"
            public static let searchIcon = "magnifyingglass"
            public static let searchLabel = "Search"
            public static let addNFTIcon = "plus.circle.fill"
            public static let addNFTLabel = "Add"
            public static let cartIcon = "cart"
            public static let cartLabel = "Cart"
            public static let profileIcon = "person"
            public static let profileLabel = "Profile"
        }
        enum Onboarding {
            public static let description = String(localized: "Discover, buy, sell, and trade unique digital assets known as non-fungible tokens (NFTs). Browse through various collections of NFTs and view detailed information about each individual NFT.", comment: "App description on onboarding screen")
            public static let getStartedLabel = String(localized: "Get Started", comment: "Text label of get started button")
        }
        enum CustomViews {
            public static let appName = String(localized: "NFTio", comment: "App name")
        }
        enum Checkout {
            public static let screenTitle = "Checkout"
            public static let checkoutButton = "complete purchase"
            public static let totalAmount = "total amount"
            public static let amountToPay = "amount to pay"
            public static let discount = "discount"
            public static let promoCodeInvite = "Enter promo code"
            public static let promoCodeAppyButton = "Apply Code"
        }
        enum NFTDetail {
            public static let screenTitle = "Details"
            public static let buyButton = "Buy Now"
            public static let buyButtonIcon = "creditcard"
            public static let makeOfferButton = "Make Offer"
            public static let offerButtonIcon = "dollarsign.square"
            public static let priceLabel = "Current Price"
            public static let timeLeftLabel = "Time left"
            public static let expiredAuctionMessage = "This auction has expired. Wait for a new one!"
            public static let auctionEndsOnLabel = "Auction ends on"
            
        }
        enum ErrorMessages {
            public static let JSONFileNotFound = "JSON file not found!"
            public static let noInternetConnection = "No internet connection. The data that you see may be not full and outdated!"
            public static let noConnectionWithHost = "Can not connect to the host!"
            public static let BadConnection = "Failed to connect to the server!"
            public static let responseError = "No proper response from the server"
            public static let decodingError = "Error in decoding data!"
            public static let badRequest = "Bad request"
            public static let imageUploadFailed = "Failed to upload image!"
        }
        
        enum Auth {
            public static let signIn = "Sign In"
            public static let signInIcon = "arrow.right.square"
            public static let register = "Register"
            public static let logout = "Sign Out"
            public static let registerIcon = "square.and.pencil"
            public static let backToSignIn = "Back To Sign In"
            public static let backToSignInIcon = "arrow.left.square"
            public static let closeIcon = "xmark.circle.fill"
            public static let emailFieldLabel = "Email"
            public static let usernameFieldLabel = "Username"
            public static let passwordFieldLabel = "Password"
            public static let rePasswordFieldLabel = "Repeat Password"
            public static let visiblePasswordIcon = "eye.slash"
            public static let notVisiblePasswordIcon = "eye"
            public static let title = "Your Profile"
            public static let editTitle = "Edit Your Profile"
            public static let editButtonLabel = "Update"
            public static let myNFTItemsTitle = "My NFT Items"
        }
        
        enum AddNFT {
            public static let title = "Add NFT for Sale"
            public static let buttonLabel = "Add NFT"
            public static let buttonIcon = "square.and.arrow.down"
        }
        
        enum Cart {
            public static let title = "Your Cart"
            public static let emptyMessage = "No NFT items in cart!"
            public static let checkoutButtonLabel = "Checkout"
        }
    }
    // swiftlint:enable all
}
