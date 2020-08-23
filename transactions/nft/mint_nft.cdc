import NonFungibleToken from 0x01cf0e2f2f715450
import ExampleNFT from 0x179b6b1cb6755e31

// This script uses the NFTMinter resource to mint a new NFT
// It must be run with the account that has the minter resource
// stored in /storage/NFTMinter

transaction(recipient: Address) {
    
    // local variable for storing the minter reference
    let minter: &ExampleNFT.NFTMinter

    prepare(signer: AuthAccount) {

        // borrow a reference to the NFTMinter resource in storage
        self.minter = signer.borrow<&ExampleNFT.NFTMinter>(from: /storage/NFTMinter)
            ?? panic("Could not borrow a reference to the NFT minter")
    }

    execute {
        // Get the public account object for the recipient
        let recipient = getAccount(recipient)

        // Borrow the recipient's public NFT collection reference
        let receiver = recipient
            .getCapability(/public/NFTCollection)!
            .borrow<&{NonFungibleToken.CollectionPublic}>()
            ?? panic("Could not get receiver reference to the NFT Collection")

        // Mint the NFT and deposit it to the recipient's collection
        self.minter.mintNFT(recipient: receiver)
    }
}
 