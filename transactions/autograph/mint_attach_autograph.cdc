import NonFungibleToken from 0x01cf0e2f2f715450
import TopShot from 0x179b6b1cb6755e31
import Autograph from 0xf3fcd2c1a78f5eee

// This transaction is how a TopShot + Autograph user would mint
// an autograph to a moment in their account

// Parameters:
//
// momentID: The id of the moment to attach autograph
// metadata: Dictionary of Autograph metadata

transaction(momentID: UInt64, metadata: {String: String}) {
    prepare(acct: AuthAccount) {
        // borrow a reference to the owner's collection
        let collectionRefTopShot = acct.borrow<&TopShot.Collection>(from: /storage/TopShotCollection)
            ?? panic("Could not borrow a reference to the stored TopShot collection")
        
        // Borrow a reference to the specified moment
        let moment = collectionRefTopShot.borrowMoment(id: momentID)
            ?? panic("Could not borrow a reference to the specified moment")

        // Mint a new NFT
        let autograph <- Autograph.mintAutograph(metadata: metadata)
        
        // Attach the autograph to the moment
        let oldAutograph <- moment.autographs[autograph.id] <- autograph
        destroy oldAutograph
    }
}
 