//
//  GenericError.swift
//  
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

public struct GenericError: Error, CustomStringConvertible {
    let reason: String

    public var description: String {
        "\(type(of: self)): Reason: \(reason)"
    }

    public init(_ reason: String) {
        self.reason = reason
    }
}
