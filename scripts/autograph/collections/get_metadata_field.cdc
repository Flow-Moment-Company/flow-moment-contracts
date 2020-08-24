import Autograph from 0xf3fcd2c1a78f5eee

// This script gets the metadata associated with a autograph
// in a collection by looking up its metadata in the Autograph
// contract. It returns the value for the specified metadata field

pub fun main(account: Address, id: UInt64, fieldToSearch: String): String {

    // borrow a public reference to the owner's autograph collection 
    let collectionRef = getAccount(account).getCapability(/public/AutographCollection)!
        .borrow<&{Autograph.AutographCollectionPublic}>()
        ?? panic("Could not get public autograph collection reference")

    // borrow a reference to the specified autograph in the collection
    let token = collectionRef.borrowAutograph(id: id)
        ?? panic("Could not borrow a reference to the specified autograph")

    // Get the autograph's metadata
    log(token.metadata[fieldToSearch])
    return token.metadata[fieldToSearch]!
}