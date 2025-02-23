//
//  AdvancedLogger.swift
//  UtilityCoreKit
//
//  Created by Ofir Ron on 23/02/2025.
//

import Foundation

protocol AdvancedLogger: Logger {
    //func debug(_ message: @autoclosure () -> String, file: StaticString = #file, function: StaticString = #function, line: UInt = #line)
    
    
    /// Logs very detailed debugging information useful for tracing program execution.
    /// The most detailed level, used for very low-level debugging information. It's generally not enabled in production builds due to the high volume of messages.
    /// - Parameters:
    ///   - message: The message to log.
    ///   - file: The file name where the log is called.
    ///   - line: The line number where the log is called.
    ///   - function: The function name where the log is called.
    func logTrace(_ message: String, file: String, line: Int, function: String)

    /// Logs detailed debugging information for diagnosing issues.
    /// Used for debugging purposes, providing detailed information about the program's flow and state.
    /// - Parameters:
    ///   - message: The message to log.
    ///   - file: The file name where the log is called.
    ///   - line: The line number where the log is called.
    ///   - function: The function name where the log is called.
    func logDebug(_ message: String, file: String, line: Int, function: String)
    
    /// Logs routine informational messages about normal operation.
    /// Used for informational messages that might be helpful for understanding the program's behavior but aren't necessarily indicative of problems.
    /// - Parameters:
    ///   - message: The message to log.
    ///   - file: The file name where the log is called.
    ///   - line: The line number where the log is called.
    ///   - function: The function name where the log is called.
    func logInfo(_ message: String, file: String, line: Int, function: String)
    
    /// Logs noteworthy events or conditions that are less common and slightly more significant than standard info messages.
    /// Examples include timer milestones or infrequent state changes.
    /// - Parameters:
    ///   - message: The message to log.
    ///   - file: The file name where the log is called.
    ///   - line: The line number where the log is called.
    ///   - function: The function name where the log is called.
    /// - Note: Prefer `logInfo` for routine informational messages. Use `logNotice` sparingly for events that deserve extra attention but aren’t warnings.
    func logNotice(_ message: String, file: String, line: Int, function: String)

    /// Logs potential issues that could lead to problems but haven't caused failures yet.
    /// - Parameters:
    ///   - message: The message to log.
    ///   - file: The file name where the log is called.
    ///   - line: The line number where the log is called.
    ///   - function: The function name where the log is called.
    func logWarning(_ message: String, file: String, line: Int, function: String)
    
    /// Logs an error condition with a descriptive message.
    /// Used for errors that have occurred but haven't caused the program to crash.
    /// - Parameters:
    ///   - message: The message describing the error.
    ///   - file: The file name where the log is called.
    ///   - line: The line number where the log is called.
    ///   - function: The function name where the log is called.
    /// - Note: If an `Error` object is available, use `logError(_:error:file:line:function:)` for additional context.
    func logError(_ message: String, file: String, line: Int, function: String)
    
    /// Logs an error condition with a descriptive message and an associated error object.
    /// Used for errors that have occurred but haven't caused the program to crash.
    /// - Parameters:
    ///   - message: The message describing the error.
    ///   - error: The error object providing additional details.
    ///   - file: The file name where the log is called.
    ///   - line: The line number where the log is called.
    ///   - function: The function name where the log is called.
    func logError(_ message: String, error: Error, file: String, line: Int, function: String)
    
    /// Logs critical errors that have caused the program to crash or become unusable.
    /// - Parameters:
    ///   - message: The message to log.
    ///   - file: The file name where the log is called.
    ///   - line: The line number where the log is called.
    ///   - function: The function name where the log is called.
    func logFault(_ message: String, file: String, line: Int, function: String)
    
    /// Logs a message at a specified log level without contextual information.
    /// - Parameters:
    ///   - level: The log level severity (e.g., trace, debug, info, etc.).
    ///   - message: The message to log.
    ///   - file: The file name where the log is called (auto-captured).
    ///   - line: The line number where the log is called (auto-captured).
    ///   - function: The function name where the log is called (auto-captured).
    /// - Note: Prefer using specific level methods (logDebug, logInfo, etc.) for better readability.
    ///         Use this for dynamic level selection or custom log levels.
    func log(_ level: LoggerLevel, _ message: String, file: String, line: Int, function: String)

    /// Logs temporary, developer-specific messages during feature development or debugging.
    /// - Parameters:
    ///   - message: The message to log.
    ///   - file: The file name where the log is called.
    ///   - line: The line number where the log is called.
    ///   - function: The function name where the log is called.
    /// - Warning: This is for temporary use only. Replace with an appropriate log level (e.g., `logDebug`, `logInfo`) or remove before merging to production.
    func logDev(_ message: String, file: String, line: Int, function: String)

}
/*
// TODO: maybe this should be to Logger, as it was before I extract this
/// Extension to provide convenient overloads that automatically capture contextual information (file, line, function).
/// These overloads are optional; developers can use the full methods to supply custom context if needed.
public extension AdvancedLogger {
    /// Logs very detailed debugging information with automatic context.
    func logTrace(_ message: String) {
        logTrace(message, file: #file, line: #line, function: #function)
    }
    
    /// Logs detailed debugging information with automatic context.
    func logDebug(_ message: String) {
        logDebug(message, file: #file, line: #line, function: #function)
    }
    
    /// Logs routine informational messages with automatic context.
    func logInfo(_ message: String) {
        logInfo(message, file: #file, line: #line, function: #function)
    }
    
    /// Logs noteworthy events with automatic context.
    func logNotice(_ message: String) {
        logNotice(message, file: #file, line: #line, function: #function)
    }
    
    /// Logs potential issues with automatic context.
    func logWarning(_ message: String) {
        logWarning(message, file: #file, line: #line, function: #function)
    }
    
    /// Logs an error with a message and automatic context.
    func logError(_ message: String) {
        logError(message, file: #file, line: #line, function: #function)
    }
    
    /// Logs an error with a message, `Error` object, and automatic context.
    func logError(_ message: String, error: Error) {
        logError(message, error: error, file: #file, line: #line, function: #function)
    }
    
    /// Logs critical errors with automatic context.
    func logFault(_ message: String) {
        logFault(message, file: #file, line: #line, function: #function)
    }
    
    func log(_ level: LoggerLevel, message: String) {
        log(level, message, file: #file, line: #line, function: #function)
    }
    
    /// Logs temporary developer messages with automatic context.
    func logDev(_ message: String) {
        logDev(message, file: #file, line: #line, function: #function)
    }
}
*/
