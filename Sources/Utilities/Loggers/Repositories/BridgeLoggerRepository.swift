//
//  BridgeLoggerRepository.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

/// A logger that forwards log messages to a custom callback.
public struct BridgeLoggerRepository {
    /// A closure to handle log messages.
    var onLog: ((String) -> Void)?

    /// Initializes a new `BridgeLoggerRepository` instance.
    ///
    /// - Parameter onLog: A closure to handle log messages.
    public  init(onLog: ( (String) -> Void)? = nil) {
        self.onLog = onLog
    }
}

extension BridgeLoggerRepository: Logger {
    public func logInfo(_ message: String) {
        onLog?(message)
    }

    public func logWarning(_ message: String) {
        onLog?(message)
    }

    public func logError(_ message: String) {
        onLog?(message)
    }

    public func logError(_ message: String, error: Error) {
        onLog?(message + " error: \(error)")
    }

    public func logEvent(_ event: String) {
        onLog?(event)
    }

    public func log(_ level: LoggerLevel, _ message: String) {
        onLog?(message)
    }

    public func logDev(_ string: String) {
        onLog?(string)
    }
}
