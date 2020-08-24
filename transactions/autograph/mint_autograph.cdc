import Autograph from 0xf3fcd2c1a78f5eee

// This transaction is what an user would use to mint a single new autograph
// and deposit it in a user's collection

transaction(metadata: {String: String}, recipientAddr: Address) {
    execute {
        // Mint a new NFT
        let autograph <- Autograph.mintAutograph(metadata: metadata)

        // get the public account object for the recipient
        let recipient = getAccount(recipientAddr)

        // get the Collection reference for the receiver
        let receiverRef = recipient.getCapability(/public/AutographCollection)!.borrow<&{Autograph.AutographCollectionPublic}>()
            ?? panic("Cannot borrow a reference to the recipient's autograph collection")

        // deposit the NFT in the receivers collection
        receiverRef.deposit(token: <-autograph)
    }
}