import TopShot from 0x179b6b1cb6755e31
import Autograph from 0xf3fcd2c1a78f5eee

// This script returns true if a autograph with the specified ID
// exists in a user's moment

pub fun main(account: Address, momentID: UInt64, autographID: UInt64): Bool {
    // get the public capability for the owner's moment collection
    // and borrow a reference to it
    let collectionRef = getAccount(account).getCapability(/public/MomentCollection)!
        .borrow<&{TopShot.MomentCollectionPublic}>()
        ?? panic("Could not get public moment collection reference")

    // Borrow a reference to the specified moment
    let moment = collectionRef.borrowMoment(id: momentID)
        ?? panic("Could not borrow a reference to the specified moment")

    return (&moment.autographs[autographID] as &Autograph.NFT) != nil
}