//
//  BridgeLoggerRepository.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

public struct BridgeLoggerRepository {
    var onLog: ((String) -> Void)?

    public  init(onLog: ( (String) -> Void)? = nil) {
        self.onLog = onLog
    }
}

extension BridgeLoggerRepository: Logger {
    public func logInfo(_ message: String) {
        onLog?(message)
    }

    public func logError(_ message: String) {
        onLog?(message)
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
