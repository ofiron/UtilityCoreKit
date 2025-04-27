//
//  TimeHelper.swift
//  UtilityCoreKit
//
//  Created by Ofir Ron on 25/04/2025.
//

import Foundation

/// A helper struct for time-related conversions and calculations.
public struct TimeHelper {
    /// Typealias representing hours, minutes, and seconds.
    public typealias HMS = (hours: Int, minutes: Int, seconds: Int)
    
    /// Converts total seconds into hours, minutes, and seconds.
    /// - Parameter seconds: Total seconds to convert.
    /// - Returns: A tuple containing hours, minutes, and seconds.
    public static func secondsToHMS(_ seconds: Int) -> HMS {
        guard seconds >= 0 else {
            // Handle negative input if necessary, here we just treat it as zero
            return (0, 0, 0)
        }

        let hours = seconds / 3600
        let minutes = (seconds % 3600) / 60
        let secondsPart = seconds % 60
        return (hours, minutes, secondsPart)
    }
    
    /// Converts hours, minutes, and seconds to total seconds.
    /// - Parameters:
    ///   - hours: Number of hours.
    ///   - minutes: Number of minutes (should be >= 0).
    ///   - seconds: Number of seconds (should be >= 0).
    ///   - safe: Don't allow to crash return overflow report
    /// - Returns: Total seconds.
    public static func hmsToSeconds(hours: Int, minutes: Int, seconds: Int, safe: Bool = false) -> Int {
        // Optional: Validate input
        guard hours >= 0, minutes >= 0, seconds >= 0 else {
            // Handle invalid input as needed, here defaulting to zero
            return 0
        }

        if safe {
            // Use overflow operators
            return (hours &* 3600)
                .addingReportingOverflow(minutes &* 60)
                .partialValue
                .addingReportingOverflow(seconds)
                .partialValue
        } else {
            return (hours * 3600) + (minutes * 60) + seconds
        }
    }
    
    /// Converts a time represented as an HMS tuple into total seconds.
    /// - Parameter hms: Tuple containing hours, minutes, and seconds.
    /// - Returns: Total seconds represented by the tuple.
    public static func hmsToSeconds(hms: HMS) -> Int {
        hmsToSeconds(hours: hms.hours, minutes: hms.minutes, seconds: hms.seconds)
    }
    
    /// Converts a TimeInterval (seconds) to hours, minutes, and seconds.
    /// - Parameter timeInterval: The total time interval in seconds.
    /// - Returns: A tuple with hours, minutes, and seconds.
    public static func timeIntervalToHMS(_ timeInterval: TimeInterval) -> HMS {
        // Convert to non-negative integer seconds
        let totalSeconds = Int(max(0, timeInterval))
        return secondsToHMS(totalSeconds)
    }

    /// Converts hours, minutes, and seconds into a TimeInterval.
    /// - Parameters:
    ///   - hours: Number of hours.
    ///   - minutes: Number of minutes.
    ///   - seconds: Number of seconds.
    /// - Returns: The total time interval in seconds.
    public static func hmsToTimeInterval(hours: Int, minutes: Int, seconds: Int) -> TimeInterval {
        hmsToTimeInterval(hms: (hours, minutes, seconds))
    }
    
    /// Converts a time represented as an HMS tuple into a TimeInterval.
    /// - Parameter hms: Tuple containing hours, minutes, and seconds.
    /// - Returns: The total time interval in seconds.
    public static func hmsToTimeInterval(hms: HMS) -> TimeInterval {
        TimeInterval(hmsToSeconds(hms: hms))
    }
}


