//
//  Double+Init-Throwing.swift
//  UtilityCoreKit
//
//  ReCreated by Ofir Ron on 28/01/2025.
//  Created by Ofir Ron on 28/01/2025.
//

import Foundation

extension Double {
    /// Initializes a `Double` from a string representation, throwing an error if the conversion fails.
    ///
    /// - Parameter text: The string representation of the double.
    /// - Throws: An error if the conversion fails.
    @inlinable public init<S>(throwing text: S) throws where S : StringProtocol {
        guard let value = Self(text) else {
            throw NSError(domain: "DoubleInitializationError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to initialize Double from string: \(text)"])
        }

        self = value
    }
}
