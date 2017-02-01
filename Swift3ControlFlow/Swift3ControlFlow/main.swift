//
//  main.swift
//  Swift3ControlFlow
//
//  Created by Orest Mykha on 12/25/16.
//  Copyright © 2016 Orest Mykha. All rights reserved.
//

import Foundation

// 1
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print(answer)

// 2
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput.characters {
    if charactersToRemove.contains(character) {
        continue
    } else {
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)
