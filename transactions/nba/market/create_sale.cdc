import Market from 0x179b6b1cb6755e31

transaction(beneficiaryAccount: Address, cutPercentage: UFix64) {
    prepare(acct: AuthAccount) {
        let ownerCapability = acct.getCapability(/public/%sReceiver)!
        let beneficiaryCapability = getAccount(beneficiaryAccount).getCapability(/public/%sReceiver)!

        let collection <- Market.createSaleCollection(ownerCapability: ownerCapability, beneficiaryCapability: beneficiaryCapability, cutPercentage: cutPercentage)
        
        acct.save(<-collection, to: /storage/topshotSaleCollection)
        
        acct.link<&Market.SaleCollection{Market.SalePublic}>(/public/topshotSaleCollection, target: /storage/topshotSaleCollection)
    }
}