import FungibleToken from 0x01cf0e2f2f715450
import DapperUtilityCoin from 0x01cf0e2f2f715450
import TopShot from 0x179b6b1cb6755e31
import Market from 0x179b6b1cb6755e31

// This transaction is for a user to purchase a moment that another user
// has for sale in their sale collection

transaction(sellerAddress: Address, tokenID: UInt64, purchaseAmount: UFix64) {
    prepare(acct: AuthAccount) {

        // borrow a reference to the signer's collection
        let collection = acct.borrow<&TopShot.Collection>(from: /storage/MomentCollection)
            ?? panic("Could not borrow reference to the Moment Collection")

        // borrow a reference to the signer's fungible token Vault
        let provider = acct.borrow<DapperUtilityCoin.Vault{FungibleToken.Provider}>(from: /storage/dapperUtilityCoinVault)!
        
        // withdraw tokens from the signer's vault
        let tokens <- provider.withdraw(amount: purchaseAmount) as! @DapperUtilityCoin.Vault

        // get the seller's public account object
        let seller = getAccount(sellerAddress)

        // borrow a public reference to the seller's sale collection
        let topshotSaleCollection = seller.getCapability(/public/topshotSaleCollection)!
            .borrow<&{Market.SalePublic}>()
            ?? panic("Could not borrow public sale reference")
    
        // purchase the moment
        let purchasedToken <- topshotSaleCollection.purchase(tokenID: tokenID, buyTokens: <-tokens)

        // deposit the purchased moment into the signer's collection
        collection.deposit(token: <-purchasedToken)
    }
}
