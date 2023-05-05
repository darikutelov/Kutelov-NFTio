# App Name: NFTio (Go Shopping)

## Description:

- NFTio is a full featured iOS SwiftUI mobile app designed for users to discover, buy, sell, and trade unique digital assets known as non-fungible tokens (NFTs). The app is designed with an easy-to-use interface, allowing users to browse through various collections of NFTs and view detailed information about each individual NFT.

## Splash screen

- the app has a splash screen with animation (https://github.com/darikutelov/Kutelov-NFTio/blob/master/NFTio/Views/LaunchScreen.swift)

## Backend, image storage and remote DB

- The app is fetching and sending data to a custom NodeJS server hosted on Heroku: https://cryptic-oasis-81288.herokuapp.com/api/v1/
- The nft, category, collection and user images are stored in cloud service call Cloudinary.com. The uploading is handled by the backend server. The app is fetching the images directly from Cloudinary.
- All data are saved to a cloud database at mongodb.com

## Data flow

### NFT items and NFT collections

- are stored locally in app documents folder in JSON format (https://github.com/darikutelov/Kutelov-NFTio/blob/master/NFTio/Managers/NFTDataManager.swift)
- fetched on app launch from the remote server and fresh data are saved in the app documents folder (https://github.com/darikutelov/Kutelov-NFTio/tree/master/NFTio/APIClient)

### User data

- user data are stored in local storage (https://github.com/darikutelov/Kutelov-NFTio/blob/master/NFTio/Managers/UserDataManager.swift)

## User authentication

- Users register and login with email and password to the backend server
- Upon successful log in the server sends back a JWT token to the app via a cookie for further autentication.
- The JWT token is stored in the UserDefaults local storage of the app with the user instance to be persisted accross app re-launches
- the APIClient service attaches the JWT token to each further request to the backend server in the request headers as "x-access-token"
- the backend server verifies the token and then allows access to paths protected for authenticated users (mainly to post data other the login and register)

## NFT Search view

- search view displays a list of all NFT items on sale (https://github.com/darikutelov/Kutelov-NFTio/blob/master/NFTio/Views/SearchScreen/SearchScreenView.swift)
- you can look for an NFT Item by typing its name in the search box
- you can pull down the screen to refresh the nft items data from the remote server
- on item tap an item detail view is opened

## NFT Detail view

- displays more information about an NFT (https://github.com/darikutelov/Kutelov-NFTio/tree/master/NFTio/Views/NFTDetailScreen)
- authenticated users can like or unlike
- if there is an auction expiry date a timer is displayed to count the remaining time
- authenticated users can place a bid for an item that has an auction
- the item is added to the cart by tap on Buy Now buttom

## Cart view

- displays all items added to the cart (https://github.com/darikutelov/Kutelov-NFTio/tree/master/NFTio/Views/CartScreen)
- items are added to the cart with "Buy Now" Button from NFT detailed view
- swipe left a cart item to delete it
- swipe righ a cart item to increase or decrease its quanity

## Discounts and Payment Options

- Discounts and payment options are handled in checkout view (https://github.com/darikutelov/Kutelov-NFTio/tree/master/NFTio/Views/Checkout)
- User can pay with his crypto wallet (charged on the server)
- User can pay with credit cart via Stripe (to test enter card number: 4242 4242 4242 4242, exp. date: 07/24, CVC: 123, ZIP 454555). The payment is registered in a test merchant account in Stripe. You will see it in the demo video.
- User can pay with Apple Pay
- upon successfull payment a success alert appears and the item is added to my NFT items in the profile

## Add NFT item

- autenticated users can add an NFT item for sale (https://github.com/darikutelov/Kutelov-NFTio/tree/master/NFTio/Views/AddNFTForSaleScreen)
- uploaded image is sent to the backend where is uploaded to Cloudinary

## Profile view

- the Profile tab bar button is visible only for authenticated users
- users can see their profile data (https://github.com/darikutelov/Kutelov-NFTio/tree/master/NFTio/Views/ProfileScreen)
- users can update their email, username and avatar
- there is also a section with list of the nft items purchased by the user
