//
//  MockRetrySimulator.swift
//  UtilityCoreKit
//
//  Created by Ofir Ron on 23/02/2025.
//

import Foundation

/// Development tool for simulating API retry behavior with configurable failure patterns
public final class MockRetrySimulator {
    /// Controls whether mock errors should be thrown
    public var isEnabled: Bool {
        didSet {
            logger?.logInfo("Retry Simulator: \(isEnabled ? "Enabled" : "Disabled")")
        }
    }
    
    /// Number of required failures before a success (0 = never fail)
    public var requiredFailures: Int {
        didSet {
            guard requiredFailures >= 0 else {
                fatalError("MockRetrySimulator: requiredFailures must be ≥ 0")
            }
            attemptCounts.removeAll()
            logger?.logInfo("Retry Simulator: Required failures updated to \(requiredFailures)")
        }
    }
    
    private let lock = NSLock()
    private var attemptCounts = [String: Int]()
    
    private let logger: Logger?
    
    /// Creates a new retry simulator with configuration
    /// - Parameters:
    ///   - requiredFailures: Number of consecutive failures before success (0 = disable failures)
    ///   - isEnabled: Whether simulator is active initially
    public init(
        requiredFailures: Int = 3,
        isEnabled: Bool = true,
        logger: Logger? = DebugAreaLoggerRepository()
    ) {
        guard requiredFailures >= 0 else {
            fatalError("MockRetrySimulator: requiredFailures must be ≥ 0")
        }
        
        self.requiredFailures = requiredFailures
        self.isEnabled = isEnabled
        self.logger = logger
    }

    /// Simulates retry pattern for a specific API endpoint
    public func simulateRetry(for identifier: String) throws {
        guard isEnabled else { return }
        
        lock.lock()
        defer { lock.unlock() }
        
        let count = (attemptCounts[identifier] ?? 0) + 1
        attemptCounts[identifier] = count
        
        let cycleLength = requiredFailures + 1
        
        if count % cycleLength == 0 {
            logger?.logDebug("Retry Simulator: Success cycle for \(identifier)")
            attemptCounts[identifier] = 0  // Reset counter
            return
        }
        
        let error = DevelopmentError.temporary(
            message: "\(identifier) failure (\(count % cycleLength)/\(requiredFailures))"
        )

        logger?.logError("Retry Simulator: \(error.description)")
        throw error
    }

    /// Resets all tracking counters
    public func reset() {
        lock.lock()
        defer { lock.unlock() }
        attemptCounts.removeAll()
    }
    
    /// Gets current attempt count for specific endpoint
    public func attemptCount(for identifier: String) -> Int {
        lock.lock()
        defer { lock.unlock() }
        return attemptCounts[identifier] ?? 0
    }
}
