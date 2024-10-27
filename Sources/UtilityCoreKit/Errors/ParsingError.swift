//
//  ParsingError.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

/// A generic parsing error that can be used to indicate various parsing issues.
///
/// It conforms to `CustomStringConvertible` to provide human-readable error messages.
public enum ParsingError: Error, CustomStringConvertible {
    /// Indicates that the data being parsed is malformed or invalid.
    case invalidData(String?)
    /// Indicates that a required field is missing from the data.
    case missingField(String?)
    /// Indicates that an unexpected value was encountered during parsing.
    case unexpectedValue(String?)
    /// A catch-all error for unexpected errors that don't fit into the other categories.
    case unknownError(Error?)

    /// A human-readable description of the error.
    public var description: String {
        switch self {
        case .invalidData(let message):
            return "Invalid data: \(message ?? "Unknown error")"
        case .missingField(let field):
            return "Missing field: \(field ?? "Unknown field")"
        case .unexpectedValue(let value):
            return "Unexpected value: \(value ?? "Unknown value")"
        case .unknownError(let error):
            return "Unknown error: \(error?.localizedDescription ?? "Unknown error")"
        }
    }
}
