import TopShot from 0x179b6b1cb6755e31

// This script reads the next Set ID from the TopShot contract and 
// returns that number to the caller

pub fun main(): UInt32 {
    log(TopShot.nextSetID)
    return TopShot.nextSetID
}