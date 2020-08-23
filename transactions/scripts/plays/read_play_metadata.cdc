import TopShot from 0x179b6b1cb6755e31

// This script returns the full metadata associated with a play
// in the TopShot smart contract

pub fun main(playID: UInt32): {String:String} {
    let metadata = TopShot.getPlayMetaData(playID: playID) ?? panic("Play doesn't exist")
    log(metadata)
    return metadata
}