//
//  Init-Throwing.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

extension Int {
    /// Initializes an `Int` from a string representation, throwing an error if the conversion fails.
    ///
    /// - Parameter description: The string representation of the integer.
    /// - Throws: An error if the conversion fails.
    @inlinable public init(throwing description: String) throws {
        guard let value = Int(description) else {
            throw NSError(domain: "IntInitializationError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to initialize Int from string: \(description)"])
        }

        self = value
    }
}

extension Double {
    /// Initializes a `Double` from a string representation, throwing an error if the conversion fails.
    ///
    /// - Parameter text: The string representation of the double.
    /// - Throws: An error if the conversion fails.
    @inlinable public init<S>(throwing text: S) throws where S : StringProtocol {
        guard let value = Self(text) else {
            throw NSError(domain: "IntInitializationError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to initialize Double from string: \(text)"])
        }

        self = value
    }
}
