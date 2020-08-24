import TopShot from 0x179b6b1cb6755e31

// This script returns the full metadata associated with a play
// in the TopShot smart contract
//
pub fun main(playID: UInt32, field: String): String {
    let field = TopShot.getPlayMetaDataByField(playID: playID, field: field) ?? panic("Play doesn't exist")

    log(field)

    return field
}