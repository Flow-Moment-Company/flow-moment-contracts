import TopShot from 0x179b6b1cb6755e31

// This script reads the next Set ID from the TopShot contract and 
// returns that number to the caller

pub fun main(setID: UInt32): String {
    let name = TopShot.getSetName(setID: setID)
        ?? panic("Could not find the specified set")
        
    return name
}