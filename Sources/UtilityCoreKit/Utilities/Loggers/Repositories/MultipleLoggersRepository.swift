//
//  MultipleLoggersRepository.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

public struct MultipleLoggersRepository {
    let loggers: [Logger]

    public init(loggers: [Logger]) {
        self.loggers = loggers
    }
}

extension MultipleLoggersRepository: Logger {
    public func logInfo(_ message: String) {
        loggers.forEach { $0.logInfo(message) }
    }

    public func logError(_ message: String) {
        loggers.forEach { $0.logError(message) }
    }

    public func logEvent(_ event: String) {
        loggers.forEach { $0.logEvent(event) }
    }

    public func log(_ level: LoggerLevel, _ message: String) {
        loggers.forEach { $0.log(level, message) }
    }

    public func logDev(_ string: String) {
        loggers.forEach { $0.logDev(string) }
    }
}
