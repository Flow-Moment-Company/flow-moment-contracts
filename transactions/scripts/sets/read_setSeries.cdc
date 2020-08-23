import TopShot from 0x179b6b1cb6755e31

// This script reads the series of the specified set and returns it

pub fun main(setID: UInt32): UInt32 {
    let series = TopShot.getSetSeries(setID: setID)
        ?? panic("Could not find the specified set")

    return series
}