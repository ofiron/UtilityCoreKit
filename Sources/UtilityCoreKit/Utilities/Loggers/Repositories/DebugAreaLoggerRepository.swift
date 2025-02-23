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
    public func logTrace(_ message: String) {
        print("📝🔍🐛 [Trace] \(message)")
    }
    
    public func logDebug(_ message: String) {
        print("📝🛠️🔧 [Debug] \(message)")
    }
    
    public func logInfo(_ message: String) {
        print("💁🏼‍♀️💁🏻‍♀️📝 [Info] \(message)")
    }
    
    public func logNotice(_ message: String) {
        print("📝📢🔔 [Notice] \(message)")
    }
    
    public func logWarning(_ message: String) {
        print("📝⚠️🚧 [Warning] \(message)")
    }
    
    public func logError(_ message: String) {
        print("📝🚨⚠️❌ [Error] \(message)")
    }
    
    public func logError(_ message: String, error: any Error) {
        print("📝🚨⚠️❌ [Error] \(message). error: \(error)")
    }
    
    public func logFault(_ message: String) {
        print("📝💥🔥⛔ [Fault] \(message)")
    }
/*
    public func logEvent(_ event: String) {
        print("📝🔖🗒️ \(event)")
    }
*/    
    public func log(_ level: LoggerLevel, _ message: String) {
        switch level {
            case .trace:
                logTrace(message)
                
            case .debug:
                logDev(message)
                
            case .info:
                logInfo(message)
                
            case .notice:
                logNotice(message)
                
            case .warning:
                logWarning(message)
                
            case .error:
                logError(message)
                
            case .fault:
                logFault(message)
                
            case .dev:
                logDev(message)
        }
    }
    
    public func logDev(_ message: String) {
        print("📝🛠️⚙️ \(message)")
    }
}
