//
//  MultipleLoggersRepository.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

/// A logger that forwards log messages to multiple underlying loggers.
public struct MultipleLoggersRepository {
    /// The underlying loggers to which messages are forwarded.
    let loggers: [Logger]

    /// Initializes a new `MultipleLoggersRepository` with the given loggers.
    ///
    /// - Parameter loggers: An array of loggers to which messages will be forwarded.
    public init(loggers: [Logger]) {
        self.loggers = loggers
    }
}

extension MultipleLoggersRepository: Logger {
    public func logTrace(_ message: String) {
        loggers.forEach { $0.logTrace(message) }
    }
    
    public func logDebug(_ message: String) {
        loggers.forEach { $0.logDebug(message) }
    }

    public func logNotice(_ message: String) {
        loggers.forEach { $0.logNotice(message) }
    }

    public func logInfo(_ message: String) {
        loggers.forEach { $0.logInfo(message) }
    }

    public func logWarning(_ message: String) {
        loggers.forEach { $0.logWarning(message) }
    }

    public func logError(_ message: String) {
        loggers.forEach { $0.logError(message) }
    }

    public func logError(_ message: String, error: Error) {
        loggers.forEach { $0.logError(message, error: error) }
    }

    public func logFault(_ message: String) {
        loggers.forEach { $0.logFault(message) }
    }

    public func log(_ level: LoggerLevel, _ message: String) {
        loggers.forEach { $0.log(level, message) }
    }

    public func logDev(_ message: String) {
        loggers.forEach { $0.logDev(message) }
    }
    
    public func logPreview(_ message: String) {
        loggers.forEach { $0.logPreview(message) }
    }
}
