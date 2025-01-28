//
//  StringConvertible.swift
//  UtilityCoreKit
//
//  ReCreated by Ofir Ron on 28/01/2025.
//  Created by Ofir Ron on 08/10/2024.
//

import Foundation

/// A protocol that defines a type that can be converted to a `String`.
public protocol StringConvertible {
    /// Converts the conforming type to a `String` representation.
    /// - Returns: A `String` representation of the instance.
    func toString() -> String
}
