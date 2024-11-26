//
//  Logger.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

/// A protocol defining the basic logging functionality.
public protocol Logger {
/*
    /// The most detailed level, used for very low-level debugging information. It's generally not enabled in production builds due to the high volume of messages.
    func logTrace(_ message: String)

    /// Used for debugging purposes, providing detailed information about the program's flow and state.
    func logDebug(_ message: String)
*/
    /// Used for informational messages that might be helpful for understanding the program's behavior but aren't necessarily indicative of problems.
    func logInfo(_ message: String)
/*
    /// Similar to info, but might indicate slightly more noteworthy events or conditions.
    func logNotice(_ message: String)

    /// Used for potential issues that could lead to problems but haven't caused any failures yet.
    func logWarning(_ message: String)
*/
    /// Used for errors that have occurred but haven't caused the program to crash.
    func logError(_ message: String)
/*
    /// Used for critical errors that have caused the program to crash or become unusable.
    func logFault(_ message: String)
*/
    // TODO: this should be removed?
    func logEvent(_ event: String)

    func log(_ level: LoggerLevel, _ message: String)

    func logDev(_ string: String)
}

/// Represents different log levels.
public enum LoggerLevel: Int {
    case event
/*
    case fault
    case error
    case warning
    case notice
*/
    case info
/*
    case debug
    case trace
*/
}
