//
//  WrapperLoggerRepository.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

/// Wrapper to pass logger.
public class WrapperLoggerRepository {
    weak var delegate: LoggerClass?

    public init(delegate: LoggerClass? = nil) {
        self.delegate = delegate
    }
}

extension WrapperLoggerRepository: Logger {
    public func logError(_ message: String) {
        delegate?.logError(message)
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
