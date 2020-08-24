import NonFungibleToken from 0x01cf0e2f2f715450
import ExampleNFT from 0x179b6b1cb6755e31

// This script reads metadata about an NFT in a user's collection
pub fun main(account: Address): UInt64 {

    // Get the public account object of the owner of the token
    let owner = getAccount(account)

    let collectionBorrow = owner
        .getCapability(/public/NFTCollection)!
        .borrow<&{NonFungibleToken.CollectionPublic}>()!

    // Borrow a reference to a specific NFT in the collection
    let nft = collectionBorrow.borrowNFT(id: 1)

    return nft.id
}