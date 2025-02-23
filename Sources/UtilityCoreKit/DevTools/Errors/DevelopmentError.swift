//
//  DevelopmentError.swift
//  UtilityCoreKit
//
//  Created by Ofir Ron on 23/02/2025.
//

import Foundation

/// A development-only error type used to simulate error conditions during testing and debugging.
///
/// Use this enum to temporarily throw errors in specific code paths to validate error handling logic.
/// All errors automatically capture debugging metadata and are only active in DEBUG configurations.
///
/// # Conformance
/// - `Error`: Can be thrown using Swift's error handling system
/// - `CustomStringConvertible`: Provides rich error descriptions with source location
public enum DevelopmentError: Error, CustomStringConvertible {
    /// Represents a temporary error condition inserted during development.
    ///
    /// - Parameters:
    ///   - message: Descriptive text explaining the simulated error condition
    ///   - file: The source file where the error was thrown (automatically captured)
    ///   - line: The line number where the error was thrown (automatically captured)
    ///
    /// - Note: This error case will only be thrown in DEBUG configurations
    /// - Important: All instances automatically capture call site location information
    case temporary(message: String = "Temporary development error", file: String = #file, line: Int = #line)
    
    /// A human-readable description of the error containing debugging metadata
    public var description: String {
        switch self {
        case let .temporary(message, file, line):
            return "Temporary Error: \(message)\nFile: \(file)\nLine: \(line)"
        }
    }
}

extension DevelopmentError {
    /// Throws a development-only error condition with optional custom message
    ///
    /// - Parameters:
    ///   - message: Custom text describing the simulated error scenario
    ///   - file: Automatically captured source file (do not provide explicitly)
    ///   - line: Automatically captured line number (do not provide explicitly)
    ///
    /// - Note: This is a no-op in release builds. Calls compile out completely from release binaries.
    /// - Important: Use this to validate error handling paths without affecting production code
    ///
    /// # Example
    /// ```swift
    /// func fetchData() async throws -> Data {
    ///     // Simulate network failure during development
    ///     try DevelopmentError.throwTemporary("Network failure simulation")
    ///     return try await actualNetworkRequest()
    /// }
    /// ```
    public static func throwTemporary(
        _ message: String = "Temporary development error",
        file: String = #file,
        line: Int = #line
    ) throws {
        #if DEBUG
        throw DevelopmentError.temporary(message: message, file: file, line: line)
        #endif
    }
}
