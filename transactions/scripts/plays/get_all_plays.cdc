import TopShot from 0x179b6b1cb6755e31

// This script returns an array of all the plays 
// that have ever been created for Top Shot

pub fun main(): [TopShot.Play] {
    return TopShot.getAllPlays()
}