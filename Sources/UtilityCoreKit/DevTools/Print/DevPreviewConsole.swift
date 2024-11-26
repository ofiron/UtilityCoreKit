//
//  File.swift
//  
//
//  Created by Ofir Ron on 26/11/2024.
//

import Foundation

/// Prints the given items to the console for debugging purposes.
///
/// - Parameters:
///     - items: The items to print.
///     - separator: The separator to use between items.
///     - terminator: The terminator to use after the last item.
public func devPreviewConsole(_ items: Any..., separator: String = " ", terminator: String = "\n") {
    print(items, separator: separator, terminator: terminator)
}
