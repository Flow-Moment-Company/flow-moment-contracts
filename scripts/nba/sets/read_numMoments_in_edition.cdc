import TopShot from 0x179b6b1cb6755e31

// This script returns the number of moments that have been
// minted for the specified edition

pub fun main(setID: UInt32, playID: UInt32): UInt32 {
    let numMoments = TopShot.getNumMomentsInEdition(setID: setID, playID: playID)
        ?? panic("Could not find the specified edition")

    return numMoments
}