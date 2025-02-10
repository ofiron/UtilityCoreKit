//
//  TimeUnitConverter.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation
import FoundationCoreKit

// MARK: - TimeUnitConverter

/// A utility  for converting time strings to TimeInterval values and vise versa.
public struct TimeUnitConverter {
}

// MARK: - String to TimeInterval
extension TimeUnitConverter {
    public static func secondsFrom(timeString: String) throws -> TimeInterval {
        // TODO: need to check it check if the format is what we need in timeHHmmssSSS and call the function
        throw NotImplementedError("TimeUnitConverter - Invalid function")
    }

    /// Converts a time string to a TimeInterval.
    ///
    /// This function supports two common time formats:
    /// 1. **HH:MM:SS.mmm**: Hours, minutes, seconds, and milliseconds separated by colons.
    /// 2. **MM:SS.mmm**: Minutes, seconds, and milliseconds separated by colons.
    ///
    /// - Parameter timeString: The time string to convert.
    /// - Returns: The equivalent TimeInterval value.
    /// - Throws: An error if the time string is invalid.
    public static func secondsFromTimeString(timeHHmmssSSS : String) throws -> TimeInterval {
        let components = timeHHmmssSSS.components(separatedBy: ":")

        guard
            (2...3).contains(components.count),
            let lastComponentParts = components.last?.components(separatedBy: "."),
            lastComponentParts.count == 2
        else {
            throw NotImplementedError("TimeUnitConverter - Invalid time format")
        }

        let includeHourValue = (components.count == 3)

        let milliSeconds = try Int(throwing: lastComponentParts[1])
        let seconds = try Int(throwing: lastComponentParts[0])
        let minutes = try Int(throwing: components[includeHourValue ? 1 : 0])
        let hours = includeHourValue ? try Int(throwing: components[0]) : 0

        let timeInterval = TimeInterval(hours * 3600 + minutes * 60 + seconds) + TimeInterval(milliSeconds) / 1_000
        return timeInterval
    }
}

// MARK: - TimeInterval to String
extension TimeUnitConverter {
    public static func convertTimeIntervalToHHSSString(_ duration: TimeInterval) -> String {
        let hours = Int(duration / 3600)
        let minutes = Int((duration.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(duration.truncatingRemainder(dividingBy: 60))

        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }

    /// Converts a TimeInterval to a formatted string representing hours, minutes, seconds, and milliseconds.
    ///
    /// - Parameter duration: The TimeInterval to be converted.
    /// - Returns: A string formatted as "HH:MM:SS.mmm".
    ///
    /// This function takes a TimeInterval (equivalent to seconds) and converts it to a human-readable string format.
    /// It calculates hours, minutes, seconds, and milliseconds, then formats them accordingly.
    ///
    /// Example:
    ///     let duration = 3661.12345 // 1 hour, 1 minute, 1 second, and 0.345 milliseconds
    ///     print(convertTimeIntervalToHHMMSSmmmString(duration)) // Output: "01:01:01.345"
    ///
    /// - Note: Milliseconds are rounded to three decimal places, but will only contain actual milliseconds (up to 999).
    ///
    /// - Warning: This function has not been thoroughly tested. Use with caution and test thoroughly in your application before relying on it.
    @available(*, deprecated, message: "Use a more reliable and well-tested library or function for time conversion, or test it yourself thoroughly before using it in production.")
    static func convertTimeIntervalToHHMMSSmmmString(_ duration: TimeInterval) -> String {
        let hours = Int(duration / 3600)
        let minutes = Int((duration.truncatingRemainder(dividingBy: 3600)) / 60)
        let seconds = Int(duration.truncatingRemainder(dividingBy: 60))
        let milliseconds = Int(duration.truncatingRemainder(dividingBy: 1000))

        return String(format: "%02d:%02d:%02d.%03d", hours, minutes, seconds, milliseconds)
    }
}
