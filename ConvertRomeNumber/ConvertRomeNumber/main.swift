//
//  main.swift
//  ConvertRomeNumber
//
//  Created by Orest Mykha on 10/29/16.
//  Copyright © 2016 Orest Mykha. All rights reserved.
//

import Foundation

func romanToDecimalSwitch(romeChar: String) -> Int {
    var result = 0
    var value = 0
    var maxValue = 0
    let roman = romeChar.uppercased().replacingOccurrences(of: "\n", with: "", options: NSString.CompareOptions.literal, range: nil)
    
    if isValidRome(romeChar: roman) == true || roman.isEmpty == true {
        for char in roman.characters.reversed() {
            switch char {
            case "M":
                value = 1000
            case "D":
                value = 500
            case "C":
                value = 100
            case "L":
                value = 50
            case "X":
                value = 10
            case "V":
                value = 5
            case "I":
                value = 1
            default:
                value = 0
            }
            maxValue = max(value, maxValue)
            result += value == maxValue ? value : -value
        }
        return result
    } else {
        return -1
    }
}

    func romanToDecimalLoop(romeChar: String) -> Int {
        let romeNumerals = ["M": 1000, "D": 500, "C": 100, "L": 50, "X": 10, "V": 5, "I": 1, "": 0]
        var result = 0
        let roman = romeChar.uppercased().replacingOccurrences(of: "\n", with: "", options: NSString.CompareOptions.literal, range: nil)
        
        if isValidRome(romeChar: roman) == true || roman.isEmpty == true {
            for (index, i) in roman.characters.enumerated() {
                if(index < roman.characters.count-1 && romeNumerals[String(i)]! < romeNumerals[String(roman.characters[roman.index(roman.startIndex, offsetBy: index+1)])]!) {
                    result -= romeNumerals[String(i)]!
                } else {
                    result += romeNumerals[String(i)]!
                }
            }
        } else {
            result = -1
        }
        return result
    }

    //Check if rome value is valid
    func isValidRome(romeChar: String) -> Bool {
        let romeERegular = "^(?=[MDCLXVI])M*(C[MD]|D?C{0,3})(X[CL]|L?X{0,3})(I[XV]|V?I{0,3})$"
        let romeTest = NSPredicate(format:"SELF MATCHES %@", romeERegular)
        let result = romeTest.evaluate(with: romeChar)
        return result
    }

    //Function for get and convert input data to string
    func input() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        return NSString(data: inputData, encoding: String.Encoding.utf8.rawValue) as! String
    }

    print("Please enter your romeNumber:")

    let romeString = input()

    print("\(romanToDecimalSwitch(romeChar: romeString))")
    print("\(romanToDecimalLoop(romeChar: romeString))")
