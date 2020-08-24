import TopShot from 0x179b6b1cb6755e31

// This script reads the current series from the TopShot contract and 
// returns that number to the caller
pub fun main(): UInt32 {
    return TopShot.currentSeries
}