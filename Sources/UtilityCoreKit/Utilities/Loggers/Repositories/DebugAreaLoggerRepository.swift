//
//  DebugAreaLoggerRepository.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

/// A logger that prints logs to the console with specific formatting.
public struct DebugAreaLoggerRepository {
    /// Initializes a new instance of `DebugAreaLoggerRepository`.
    public init() {}
}

extension DebugAreaLoggerRepository: Logger {
    public func logError(_ message: String) {
        print("📝🚨⚠️❌ \(message)")
    }

    public func logEvent(_ event: String) {
        print("📝🔖🗒️ \(event)")
    }

    public func logInfo(_ message: String) {
        print("💁🏼‍♀️💁🏻‍♀️ \(message)")
    }

    public func log(_ level: LoggerLevel, _ message: String) {
        switch level {
            case .event:
                logEvent(message)

            case .info:
                logInfo(message)
        }
    }

    public func logDev(_ string: String) {
        print("📝🛠️⚙️ \(string)")
    }
}
