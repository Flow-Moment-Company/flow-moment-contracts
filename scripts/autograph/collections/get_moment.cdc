import TopShot from 0x179b6b1cb6755e31

// This script gets the moment in a collection by looking up its ID
// in the TopShot contract

// Paramters
// account: The Flow Address of the account whose moment data needs to be read
// id: The unique ID for the moment whose data needs to be read
//
// Returns: &TopShot.NFT A reference to entire moment

pub fun main(account: Address, id: UInt64): &TopShot.NFT {

    // get the public capability for the owner's moment collection
    // and borrow a reference to it
    let collectionRef = getAccount(account).getCapability(/public/MomentCollection)!
        .borrow<&{TopShot.MomentCollectionPublic}>()
        ?? panic("Could not get public moment collection reference")

    // Borrow a reference to the specified moment
    let token = collectionRef.borrowMoment(id: id)
        ?? panic("Could not borrow a reference to the specified moment")

    // Get the moment
    log(token)
    return token
}