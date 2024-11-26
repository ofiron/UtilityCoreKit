//
//  NotImplementedError.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

/// A custom error type to represent a feature that is not yet implemented.
public struct NotImplementedError: Error, CustomStringConvertible {

    /// The error message.
    let text: String

    /// A textual description of the error.
    public var description: String {
        "\(type(of: self)): \(text)"
    }

    /// Initializes a new `NotImplementedError` with a specific message.
    ///
    /// - Parameter text: The error message.
    public init(_ text: String) {
        self.text = text
    }

    /// Initializes a new `NotImplementedError` with a message and an underlying error.
    ///
    /// - Parameter error: The underlying error.
    public init(_ error: Error) {
        self.init("Error with inner error: \(error)")
    }
}
