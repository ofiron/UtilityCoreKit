//
//  LetterShifterTests.swift
//  UtilityCoreKit
//
//  RECreated by Ofir Ron on 29/01/2025.
//  Created by Ofir Ron on 26/12/2024.
//

import XCTest
@testable import UtilityCoreKit

final class LetterShifterTests: XCTestCase {
    private typealias ShiftLetter = (input: String, adddition: Int, expectedResult: String)
    private typealias ShiftError = LetterShifter.ShiftError

    func testCorrectValues() throws {
        let cases: [ShiftLetter] = [
            ("A", 6, "G"),
            ("A", 5, "F"),
            ("Z", 1, "AA"),
            ("Z", 2, "AB"),
            ("AAA", 1, "AAB"),
            ("AAAA", 1, "AAAB"),
            ("AAAA", 1, "AAAB"),
            ("AAAA", 3, "AAAD"),
        ]

        let letterShifter = LetterShifter()


        for aCase in cases {
            let result = try letterShifter.increment(aCase.input, by: aCase.adddition)

            XCTAssert(result == aCase.expectedResult, "input: \(aCase.input) + \(aCase.adddition) should be \(aCase.expectedResult) but it \(result)")
        }
    }

    func testEmptyString() throws {
        let cases: [ShiftLetter] = [
            ("", 1, ""),
            ("", 3, ""),
            ("", 1, "A"),
        ]

        let letterShifter = LetterShifter()

        for aCase in cases {
            XCTAssertThrowsError(try letterShifter.increment(aCase.input, by: aCase.adddition)) { error in
                XCTAssertEqual(error as! ShiftError, ShiftError.empty)
            }
        }
    }

    func testPositiveNumbers() throws {
        let cases: [ShiftLetter] = [
            ("A", 0, "A"),
            ("A", 0, "B"),
            ("A", 0, "Who care"),
            ("A", -1, ""),
            ("A", -1, "Who care"),
            ("A", -3, "Who care"),
        ]

        let letterShifter = LetterShifter()

        for aCase in cases {
            XCTAssertThrowsError(try letterShifter.increment(aCase.input, by: aCase.adddition)) { error in
                XCTAssertEqual(error as! ShiftError, ShiftError.nonPositiveValue)
            }
        }
    }

    func testInvalidValues() throws {
        let cases: [ShiftLetter] = [
            ("a", 1, "A"),
            ("a", 1, "B"),
            ("a", 1, "Who care"),
            ("3", 3, ""),
            ("5", 3, "Who care"),
            ("6", 3, "Who care"),
        ]

        let letterShifter = LetterShifter()

        for aCase in cases {
            XCTAssertThrowsError(try letterShifter.increment(aCase.input, by: aCase.adddition)) { error in
                guard case ShiftError.letterNotInAlphabet(let letter) = error else {
                    return XCTFail()
                }

                XCTAssert(letter == String(aCase.input.first!))
            }
        }
    }

    func testInvalidValueInTheEnd() throws {
        let cases: [ShiftLetter] = [
            ("Aa", 1, "A"),
            ("Aa", 1, "B"),
            ("Aa", 1, "Who care"),
            ("A3", 3, ""),
            ("A5", 3, "Who care"),
            ("A6", 3, "Who care"),
        ]

        let letterShifter = LetterShifter()

        for aCase in cases {
            XCTAssertThrowsError(try letterShifter.increment(aCase.input, by: aCase.adddition)) { error in
                guard case ShiftError.letterNotInAlphabet(let letter) = error else {
                    return XCTFail()
                }

                XCTAssert(letter == String(aCase.input.last!))
            }
        }
    }
}
