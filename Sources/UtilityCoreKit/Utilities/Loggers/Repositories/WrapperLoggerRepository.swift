//
//  WrapperLoggerRepository.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

/// A wrapper for a logger that forwards log messages to a delegate.
public class WrapperLoggerRepository {
    /// A weak reference to the delegate logger.
    public weak var delegate: LoggerClass?

    /// Initializes a new instance of the `WrapperLoggerRepository`.
    ///
    /// - Parameter delegate: The delegate logger to forward log messages to.
    public init(delegate: LoggerClass? = nil) {
        self.delegate = delegate
    }
}

extension WrapperLoggerRepository: Logger {
    public func logWarning(_ message: String) {
        delegate?.logWarning(message)
    }

    public func logError(_ message: String) {
        delegate?.logError(message)
    }

    public func logError(_ message: String, error: Error) {
        delegate?.logError(message, error: error)
    }

    public func logEvent(_ event: String) {
        delegate?.logEvent(event)
    }

    public func logInfo(_ message: String) {
        delegate?.logInfo(message)
    }

    public func log(_ level: LoggerLevel, _ message: String) {
        delegate?.log(level, message)
    }

    public func logDev(_ string: String) {
        delegate?.logDev(string)
    }
}
