//
//  Logger.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

/// A protocol defining the basic logging functionality.
public protocol Logger {
    /// The most detailed level, used for very low-level debugging information. It's generally not enabled in production builds due to the high volume of messages.
    func logTrace(_ message: String)

    /// Used for debugging purposes, providing detailed information about the program's flow and state.
    func logDebug(_ message: String)

    /// Used for informational messages that might be helpful for understanding the program's behavior but aren't necessarily indicative of problems.
    func logInfo(_ message: String)

    /// Logs noteworthy events or conditions that are less common and slightly more significant than standard info messages.
    /// Examples include timer milestones or infrequent state changes.
    /// - Parameter message: The message to log.
    /// - Note: Prefer `logInfo` for routine informational messages. Use `logNotice` sparingly for events that deserve extra attention but aren’t warnings.
    func logNotice(_ message: String)

    /// Used for potential issues that could lead to problems but haven't caused any failures yet.
    func logWarning(_ message: String)

    /// Logs an error condition with a descriptive message.
    /// Used for errors that have occurred but haven't caused the program to crash.
    /// - Parameter message: The message describing the error.
    func logError(_ message: String)

    /// Logs an error condition with a descriptive message and an associated error object.
    /// Used for errors that have occurred but haven't caused the program to crash.
    /// - Parameters:
    ///   - message: The message describing the error.
    ///   - error: The error object providing additional details.
    func logError(_ message: String, error: Error)

    /// Used for critical errors that have caused the program to crash or become unusable.
    func logFault(_ message: String)

    /// Logs a message at the specified log level.
    ///
    /// - Parameters:
    ///   - level: The severity level of the log message, defined by `LoggerLevel`.
    ///   - message: The message to log.
    func log(_ level: LoggerLevel, _ message: String)

    /// Logs temporary, developer-specific messages during feature development or debugging.
    ///
    /// - Parameter message: The message to log.
    /// - Warning: This is for temporary use only. Replace with an appropriate log level (e.g., `logDebug`, `logInfo`) or remove before merging to production.
    func logDev(_ message: String)
    
    /// Logs a preview message, typically used to display upcoming features or experimental information.
    ///
    /// - Parameter message: The message to log.
    func logPreview(_ message: String)
}

/// Represents different log levels.
public enum LoggerLevel: Int {
    case trace
    case debug
    case info
    case notice
    case warning
    case error
    case fault
    /// Special case for temporary logs
    case dev
}
