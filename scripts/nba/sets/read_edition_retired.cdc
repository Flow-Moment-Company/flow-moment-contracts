import TopShot from 0x179b6b1cb6755e31

// This transaction reads if a specified edition is retired

pub fun main(setID: UInt32, playID: UInt32): Bool {
    let isRetired = TopShot.isEditionRetired(setID: setID, playID: playID)
        ?? panic("Could not find the specified edition")
    
    return isRetired
}