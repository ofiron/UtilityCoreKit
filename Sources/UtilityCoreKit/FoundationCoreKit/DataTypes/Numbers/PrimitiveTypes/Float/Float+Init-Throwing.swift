//
//  Float+Init-Throwing.swift
//  UtilityCoreKit
//
//  Created by Ofir Ron on 28/01/2025.
//

import Foundation

extension Float {
    /// Initializes a `Float` from a string representation, throwing an error if the conversion fails.
    ///
    /// - Parameter text: The string representation of the float.
    /// - Throws: An error if the conversion fails.
    @inlinable public init<S>(throwing text: S) throws where S : StringProtocol {
        guard let value = Self(text) else {
            throw NSError(domain: "FloatInitializationError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to initialize Float from string: \(text)"])
        }

        self = value
    }
}
