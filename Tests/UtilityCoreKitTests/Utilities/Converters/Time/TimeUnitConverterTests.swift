//
//  TimeUnitConverterTests.swift
//  
//
//  Created by Ofir Ron on 27/10/2024.
//

import XCTest
@testable import UtilityCoreKit

final class TimeUnitConverterTests: XCTestCase {
    func testConvertHHmmssSSS_zero_stringTests() throws {
        let timeString = "00:00.000"

        let timeInterval = try TimeUnitConverter.secondsFromTimeString(timeHHmmssSSS: timeString)

        XCTAssertEqual(timeInterval, .zero)
    }

    func testConvertHHmmssSSS_zeroWithHourZero_stringTests() throws {
        let timeString = "00:00:00.000"

        let timeInterval = try TimeUnitConverter.secondsFromTimeString(timeHHmmssSSS: timeString)

        XCTAssertEqual(timeInterval, .zero)
    }

    func testConvertHHmmssSSS_4seconds_stringTests() throws {
        let timeString = "00:04.000"

        let timeInterval = try TimeUnitConverter.secondsFromTimeString(timeHHmmssSSS: timeString)

        XCTAssertEqual(timeInterval, 4)
    }

    func testConvertHHmmssSSS_58seconds_stringTests() throws {
        let timeString = "00:58.000"

        let timeInterval = try TimeUnitConverter.secondsFromTimeString(timeHHmmssSSS: timeString)

        XCTAssertEqual(timeInterval, 58)
    }

    func testConvertHHmmssSSS_41minutes17seconds_stringTests() throws {
        let timeString = "41:17.000"

        let timeInterval = try TimeUnitConverter.secondsFromTimeString(timeHHmmssSSS: timeString)

        XCTAssertEqual(timeInterval, 2477)
    }

    func testConvertHHmmssSSS_3hours2minutes23seconds567miliseconds_stringTests() throws {
        let timeString = "03:02:23.567"

        let timeInterval = try TimeUnitConverter.secondsFromTimeString(timeHHmmssSSS: timeString)

        XCTAssertEqual(timeInterval, 10943.567)
    }
}
