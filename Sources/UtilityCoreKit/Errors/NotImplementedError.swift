//
//  NotImplementedError.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

public struct NotImplementedError: Error, CustomStringConvertible {

    let text: String

    public var description: String {
        "\(type(of: self)): \(text)"
    }

    public init(_ text: String) {
        self.text = text
    }

    public init(_ error: Error) {
        self.init("Error with inner error: \(error)")
    }
}
