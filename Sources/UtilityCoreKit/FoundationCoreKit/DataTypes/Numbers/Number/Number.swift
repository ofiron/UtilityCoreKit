//
//  Number.swift
//  UtilityCoreKit
//
//  ReCreated by Ofir Ron on 28/01/2025.
//  Created by Ofir Ron on 31/12/2024.
//

import Foundation

/// A type that represents a numeric or potentially other types of values.
/// This enum is designed to be extensible, allowing for additional cases to be added in the future.
public enum Number {
    /// Represents an integer value.
    case int(value: Int)

    /// Represents a double value.
    case double(value: Double)

    // Future cases can be added here, such as:
    // case float(value: Float)
    // case decimal(value: Decimal)
    // case string(value: String)
}

// MARK: - Initializers

extension Number {
    /// Creates a `Number` instance with an integer value.
    /// - Parameter value: The integer value to store.
    public init(_ value: Int) {
        self = .int(value: value)
    }

    /// Creates a `Number` instance with a double value.
    /// - Parameter value: The double value to store.
    public init(_ value: Double) {
        self = .double(value: value)
    }

    // Future initializers can be added here, such as:
    // public init(_ value: Float) {
    //     self = .float(value: value)
    // }
    // public init(_ value: Decimal) {
    //     self = .decimal(value: value)
    // }
}

// MARK: - Computed Properties

extension Number {
    /// Returns the underlying value of the `Number` as a `Codable` type.
    /// This property can be used to access the stored value in a type-agnostic way.
    public var underlineValue: Codable {
        switch self {
        case .int(let value):
            return value
        case .double(let value):
            return value
        // Handle future cases here:
        // case .float(let value):
        //     return value
        // case .decimal(let value):
        //     return value
        }
    }
}
