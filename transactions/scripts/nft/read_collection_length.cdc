import NonFungibleToken from 0x01cf0e2f2f715450
import ExampleNFT from 0x179b6b1cb6755e31

// This transaction gets the length of an account's nft collection

pub fun main(account: Address): Int {
    let acct = getAccount(account)
    let collectionRef = acct.getCapability(/public/%s)!.borrow<&{NonFungibleToken.CollectionPublic}>()
        ?? panic("Could not borrow capability from public collection")
    
    return collectionRef.getIDs().length
}
 