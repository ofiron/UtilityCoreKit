//
//  GenericError.swift
//  
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

/// A generic error type that can be used to represent various errors.
public struct GenericError: Error, CustomStringConvertible {

    /// The reason for the error.
    let reason: String

    /// A textual description of the error.
    public var description: String {
        "\(type(of: self)): Reason: \(reason)"
    }

    /// Initializes a new instance of the `GenericError` struct.
    ///
    /// - Parameter reason: The reason for the error.
    public init(_ reason: String) {
        self.reason = reason
    }
}
