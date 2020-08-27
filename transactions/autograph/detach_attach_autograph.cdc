import NonFungibleToken from 0x01cf0e2f2f715450
import TopShot from 0x179b6b1cb6755e31
import Autograph from 0xf3fcd2c1a78f5eee

// This transaction is how a TopShot + Autograph user would transfer
// an autograph from a moment in their account to another moment in their account

// Parameters:
//
// momentIDFrom: The id of the moment to detach autograph
// momentIDTo: The id of the moment to attach autograph
// autographID: The id of the autograph to be moved between moments

transaction(momentIDFrom: UInt64, momentIDTo: UInt64, autographID: UInt64) {
    prepare(acct: AuthAccount) {
        // borrow a reference to the owner's collection
        let collectionRefTopShot = acct.borrow<&TopShot.Collection>(from: /storage/MomentCollection)
            ?? panic("Could not borrow a reference to the stored TopShot collection")
        
        // Borrow a reference to the specified moment
        let momentFrom = collectionRefTopShot.borrowMoment(id: momentIDFrom)
            ?? panic("Could not borrow a reference to the specified moment")

        // Borrow a reference to the specified moment
        let momentTo = collectionRefTopShot.borrowMoment(id: momentIDTo)
            ?? panic("Could not borrow a reference to the specified moment")

        // Detach the autograph from the moment
        let autograph <- momentFrom.autographs.remove(key: autographID) as! @Autograph.NFT

        // Attach the autograph to the moment
        let oldAutograph <- momentTo.autographs[autographID] <- autograph
        destroy oldAutograph
    }
}
 