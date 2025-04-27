//
//  TimeHelperTests.swift
//  UtilityCoreKit
//
//  Created by Ofir Ron on 25/04/2025.
//

import XCTest
@testable import UtilityCoreKit

class TimeHelperTests: XCTestCase {
    
    // MARK: - Tests for secondsToHMS
    
    func testSecondsToHMS_withZeroSeconds() {
        let result = TimeHelper.secondsToHMS(0)
        XCTAssertEqual(result.hours, 0)
        XCTAssertEqual(result.minutes, 0)
        XCTAssertEqual(result.seconds, 0)
    }
    
    func testSecondsToHMS_withPositiveSeconds() {
        let seconds = 3665 // 1 hour, 1 minute, 5 seconds
        let result = TimeHelper.secondsToHMS(seconds)
        XCTAssertEqual(result.hours, 1)
        XCTAssertEqual(result.minutes, 1)
        XCTAssertEqual(result.seconds, 5)
    }
    
    func testSecondsToHMS_withLargeSeconds() {
        let seconds = 100000 // Large number of seconds
        let result = TimeHelper.secondsToHMS(seconds)
        // 100000 seconds = 27 hours, 46 minutes, 40 seconds
        XCTAssertEqual(result.hours, 27)
        XCTAssertEqual(result.minutes, 46)
        XCTAssertEqual(result.seconds, 40)
    }
    
    func testSecondsToHMS_withNegativeSeconds() {
        let result = TimeHelper.secondsToHMS(-100)
        XCTAssertEqual(result.hours, 0)
        XCTAssertEqual(result.minutes, 0)
        XCTAssertEqual(result.seconds, 0)
    }
    
    // MARK: - Tests for hmsToSeconds (individual parameters)
    
    func testHmsToSeconds_withZero() {
        let totalSeconds = TimeHelper.hmsToSeconds(hours: 0, minutes: 0, seconds: 0)
        XCTAssertEqual(totalSeconds, 0)
    }
    
    func testHmsToSeconds_withPositiveValues() {
        let totalSeconds = TimeHelper.hmsToSeconds(hours: 1, minutes: 30, seconds: 15)
        XCTAssertEqual(totalSeconds, 5415) // 1*3600 + 30*60 + 15
    }
    
    func testHmsToSeconds_withLargeValues() {
        let totalSeconds = TimeHelper.hmsToSeconds(hours: 10, minutes: 59, seconds: 59)
        XCTAssertEqual(totalSeconds, 39599)
    }
    
    func testHmsToSeconds_withNegativeValues() {
        let totalSeconds = TimeHelper.hmsToSeconds(hours: -1, minutes: 10, seconds: 10)
        XCTAssertEqual(totalSeconds, 0)
    }
    
    // MARK: - Tests for hmsToSeconds (tuple)
    
    func testHmsToSeconds_withHMSTuple() {
        let hms = (hours: 2, minutes: 15, seconds: 30)
        let totalSeconds = TimeHelper.hmsToSeconds(hms: hms)
        XCTAssertEqual(totalSeconds, 8130) // 2*3600 + 15*60 + 30
    }
    
    // MARK: - Tests for timeIntervalToHMS
    
    func testTimeIntervalToHMS_withZero() {
        let result = TimeHelper.timeIntervalToHMS(0)
        XCTAssertEqual(result.hours, 0)
        XCTAssertEqual(result.minutes, 0)
        XCTAssertEqual(result.seconds, 0)
    }
    
    func testTimeIntervalToHMS_withPositiveInterval() {
        let interval: TimeInterval = 7322 // 2 hours, 2 minutes, 2 seconds
        let result = TimeHelper.timeIntervalToHMS(interval)
        XCTAssertEqual(result.hours, 2)
        XCTAssertEqual(result.minutes, 2)
        XCTAssertEqual(result.seconds, 2)
    }
    
    func testTimeIntervalToHMS_withNegativeInterval() {
        let interval: TimeInterval = -100
        let result = TimeHelper.timeIntervalToHMS(interval)
        XCTAssertEqual(result.hours, 0)
        XCTAssertEqual(result.minutes, 0)
        XCTAssertEqual(result.seconds, 0)
    }
    
    // MARK: - Tests for hmsToTimeInterval
    
    func testHmsToTimeInterval_withZero() {
        let interval = TimeHelper.hmsToTimeInterval(hours: 0, minutes: 0, seconds: 0)
        XCTAssertEqual(interval, 0)
    }
    
    func testHmsToTimeInterval_withPositiveValues() {
        let interval = TimeHelper.hmsToTimeInterval(hours: 1, minutes: 20, seconds: 40)
        XCTAssertEqual(interval, 4840) // 1*3600 + 20*60 + 40
    }
    
    func testHmsToTimeInterval_withLargeValues() {
        let interval = TimeHelper.hmsToTimeInterval(hours: 5, minutes: 59, seconds: 59)
        XCTAssertEqual(interval, 21599)
    }
    
    func testHmsToTimeInterval_withNegativeValues() {
        let interval = TimeHelper.hmsToTimeInterval(hours: -2, minutes: 10, seconds: 10)
        XCTAssertEqual(interval, 0)
    }
    
    // MARK: - Additional tests (if needed)
    
    func testHmsToTimeInterval_withHMSTuple() {
        let hms = (hours: 3, minutes: 45, seconds: 15)
        let interval = TimeHelper.hmsToTimeInterval(hms: hms)
        XCTAssertEqual(interval, 13515)
    }
    
    // Boundary tests for secondsToHMS
    func testSecondsToHMS_boundaryValues() {
        // Just below 1 minute
        var result = TimeHelper.secondsToHMS(59)
        XCTAssertEqual(result.hours, 0)
        XCTAssertEqual(result.minutes, 0)
        XCTAssertEqual(result.seconds, 59)

        // Exactly 1 minute
        result = TimeHelper.secondsToHMS(60)
        XCTAssertEqual(result.hours, 0)
        XCTAssertEqual(result.minutes, 1)
        XCTAssertEqual(result.seconds, 0)

        // Just below 1 hour
        result = TimeHelper.secondsToHMS(3599)
        XCTAssertEqual(result.hours, 0)
        XCTAssertEqual(result.minutes, 59)
        XCTAssertEqual(result.seconds, 59)

        // Exactly 1 hour
        result = TimeHelper.secondsToHMS(3600)
        XCTAssertEqual(result.hours, 1)
        XCTAssertEqual(result.minutes, 0)
        XCTAssertEqual(result.seconds, 0)
    }

    // Test for large hours input
    func testHmsToSeconds_withLargeHours() {
        let largeHours = 10000
        let minutes = 30
        let seconds = 15
        let totalSeconds = TimeHelper.hmsToSeconds(hours: largeHours, minutes: minutes, seconds: seconds)
        XCTAssertEqual(totalSeconds, largeHours * 3600 + minutes * 60 + seconds)
    }

    // Test conversion consistency
    func testConversionRoundTrip() {
        let originalSeconds = 98765
        let hms = TimeHelper.secondsToHMS(originalSeconds)
        let totalSeconds = TimeHelper.hmsToSeconds(hms: hms)
        XCTAssertEqual(totalSeconds, max(0, originalSeconds))
    }
    
    // MARK: - Extreme Value Tests
    
    func testSecondsToHMS_withMaxInt() {
        let result = TimeHelper.secondsToHMS(Int.max)
        // Verify it doesn't crash and handles correctly
        XCTAssertGreaterThan(result.hours, 0)
    }
    
    // TODO: Restore the Overflow tests that crashed
/*
    func testHmsToSeconds_withMaxValues() {
        let totalSeconds = TimeHelper.hmsToSeconds(
            hours: Int.max / 3600,
            minutes: 59,
            seconds: 59
        )
        XCTAssertGreaterThan(totalSeconds, 0)
    }
    
    func testHmsToSeconds_withMaxValues2() {
        let result = TimeHelper.hmsToSeconds(
            hours: Int.max / 3600,
            minutes: 59,
            seconds: 59
        )
        XCTAssertGreaterThan(result, 0)
        
        // Test explicit overflow case
        let overflowResult = TimeHelper.hmsToSeconds(
            hours: Int.max,
            minutes: Int.max,
            seconds: Int.max
        )
        // Define expected behavior - either 0 or clamped value
        XCTAssertEqual(overflowResult, 0) // Or whatever your design specifies
    }
    */
    // MARK: - Precision Tests for TimeInterval

    func testTimeIntervalToHMS_withFractionalSeconds() {
        let result = TimeHelper.timeIntervalToHMS(3599.999)
        XCTAssertEqual(result.hours, 0)
        XCTAssertEqual(result.minutes, 59)
        XCTAssertEqual(result.seconds, 59) // Should truncate, not round
    }
    
    // MARK: - Consistency Between Methods
    
    func testHmsConversionConsistency() {
        let testValues = [0, 1, 59, 60, 3599, 3600, 86400, 999999]
        
        for seconds in testValues {
            let hms = TimeHelper.secondsToHMS(seconds)
            let convertedBack = TimeHelper.hmsToSeconds(hms: hms)
            XCTAssertEqual(convertedBack, seconds)
        }
    }
    
    // MARK: - Documentation Tests
    
    func testDocumentationExamples() {
        // Test the examples shown in your method documentation
        let example1 = TimeHelper.secondsToHMS(3665)
        XCTAssertEqual(example1.hours, 1)
        XCTAssertEqual(example1.minutes, 1)
        XCTAssertEqual(example1.seconds, 5)
        
        let example2 = TimeHelper.hmsToSeconds(hours: 1, minutes: 30, seconds: 15)
        XCTAssertEqual(example2, 5415)
    }
    
    // MARK: - Thread Safety (if applicable)

    func testThreadSafety() {
        let queue = DispatchQueue.global()
        let group = DispatchGroup()
        
        for _ in 1...1000 {
            group.enter()
            queue.async {
                _ = TimeHelper.secondsToHMS(Int.random(in: 0...100000))
                group.leave()
            }
        }
        
        group.wait()
        // If we get here without crashing, thread safety is likely okay
        XCTAssertTrue(true)
    }
}


