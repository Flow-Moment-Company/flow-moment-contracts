import TopShot from 0x179b6b1cb6755e31
import Market from 0x179b6b1cb6755e31

// This transaction changes the price of a moment that a user has for sale

transaction(tokenID: UInt64, newPrice: UFix64) {
    prepare(acct: AuthAccount) {

        // borrow a reference to the owner's sale collection
        let topshotSaleCollection = acct.borrow<&Market.SaleCollection>(from: /storage/topshotSaleCollection)
            ?? panic("Could not borrow from sale in storage")

        // Change the price of the moment
        topshotSaleCollection.changePrice(tokenID: tokenID, newPrice: newPrice)
    }
}