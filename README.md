# App Name: NFTio (Go Shopping)

## Description:

- NFTio is a full featured iOS SwiftUI mobile app designed for users to discover, buy, sell, and trade unique digital assets known as non-fungible tokens (NFTs). The app is designed with an easy-to-use interface, allowing users to browse through various collections of NFTs and view detailed information about each individual NFT.

## Must Have Features

- [ ] NFT catalog items displayed in a list.
- [ ] Shopping catalog data fetched from an API [like OpenSea](https://docs.opensea.io/reference/api-overview) and saved in the app.
- [ ] Users can choose an item and open a detailed view to see more information about it.
- [ ] Users can choose an item from the list and add it to the shopping cart.
- [ ] Remove item(s) from the shopping cart.
- [ ] Upon checkout, the total amount to pay will be calculated.
- [ ] Users can like/ dislike items.

## Nice to Have Features

- [ ] Search NFT catalog items by name.
- [ ] Filter NFT catalog items by category, artist or collection.
- [ ] Sort NFT catalog items by price and date.
- [ ] Users can add/ remove items from a wishlist.
- [ ] User authetication with third party service (Google Firebase)
- [ ] Credit cart payment with third party service (Stripe)
- [ ] User profile with history of orders
- [ ] Users can add NFT item for sales

## NFT Detail view

## Buy Options

- all NFT can be added to the cart via "Buy Now" button
- If there is an active auction for the NFT, the user can add one bid per item via the button "Make Offer". If user tries to add a second bid, error alert will inform him that he can make only one bid.

## Cart view

- items are added to the cart with "Buy Now" Button from NFT detailed view
- swipe left a cart item to delete it
- swipe righ a cart item to increase or decrease its quanity

## Payment Options

- User can pay with his crypto wallet (charged on the server)
- User can pay with credit cart via Stripe (to test enter card number: 4242 4242 4242 4242, exp. date: 07/24, CVC: 123, ZIP 454555). The payment is registered in a test merchant account in Stripe. You will see it in the demo video.
- User can pay with Apple Pay (subject to credentials)
