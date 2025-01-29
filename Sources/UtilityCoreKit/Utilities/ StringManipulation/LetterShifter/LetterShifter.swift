//
//  LetterShifter.swift
//  UtilityCoreKit
//
//  ReCreated by Ofir Ron on 29/01/2025.
//  Created by Ofir Ron on 26/12/2024.
//

import Foundation

/// A utility for shifting letters in a string by a specified increment.
///
/// `LetterShifter` provides a method to increment each letter in a string by a given positive value,
/// wrapping around the alphabet if necessary. For example, incrementing "Z" by 1 results in "A".
///
/// - Note: This utility only supports uppercase letters from "A" to "Z".
public struct LetterShifter {
    /// Errors that can occur during the letter-shifting process.
    public enum ShiftError: Error, Equatable {
        /// Thrown when the input string is empty.
        case empty

        /// Thrown when the increment value is not a positive integer.
        case nonPositiveValue

        /// Thrown when a character in the input string is not a letter in the alphabet.
        /// - Parameter letter: The invalid character.
        case letterNotInAlphabet(letter: String)
    }

    /// Creates a new instance of `LetterShifter`.
    public init() {}

    /// Increments each letter in the input string by the specified value.
    ///
    /// This method shifts each character in the input string forward in the alphabet by the given increment.
    /// If the shift goes beyond "Z", it wraps around to the beginning of the alphabet. For example:
    /// - Incrementing "A" by 1 results in "B".
    /// - Incrementing "Z" by 1 results in "A".
    ///
    /// - Parameters:
    ///   - input: The string to be shifted. Must contain only uppercase letters from "A" to "Z".
    ///   - increment: The number of positions to shift each letter. Must be a positive integer.
    ///
    /// - Returns: A new string with each letter shifted by the specified increment.
    ///
    /// - Throws:
    ///   - `ShiftError.empty` if the input string is empty.
    ///   - `ShiftError.nonPositiveValue` if the increment is not a positive integer.
    ///   - `ShiftError.letterNotInAlphabet` if the input string contains a character not in the alphabet.
    ///
    /// - Example:
    ///   ```swift
    ///   let shifter = LetterShifter()
    ///   let result = try shifter.increment("A", by: 2) // Returns "C"
    ///   ```
    public func increment(_ input: String, by increment: Int) throws -> String {
        guard !input.isEmpty else { throw ShiftError.empty}
        guard increment > 0 else { throw ShiftError.nonPositiveValue } // Handle non-positive increments

        let alphabet = Constants.Values.alphabet
        var result = ""
        var carry = increment

        for char in input.reversed() {
            guard let index = alphabet.firstIndex(of: char) else {
                throw ShiftError.letterNotInAlphabet(letter: String(char))
            } // Handle invalid characters

            let newIndex = (index + carry) % alphabet.count
            carry = (index + carry) / alphabet.count
            result = String(alphabet[newIndex]) + result
        }

        if carry > 0 {
            result = String(repeating: "A", count: carry) + result
        }

        return result
    }
}
