//
//  Utils.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

// MARK: - Utils

/// A utility class providing common functions for various tasks.
public struct Utils {}

// MARK: - Threads
extension Utils {
    /// Executes a closure on the main thread.
    ///
    /// - Parameter closure: The closure to execute on the main thread.
    public static func mainThread(_ closure: @escaping () -> Void) {
        guard !Thread.isMainThread else {
          closure()
          return
        }

        DispatchQueue.main.async {
          closure()
        }
    }
}

// MARK: - OS Detection
extension Utils {
    /// Checks if the current platform is iOS.
    ///
    /// - Returns: `true` if the platform is iOS, `false` otherwise.
    public static func isIOS() -> Bool {
        #if os(iOS)
            return true
        #else
            return false
        #endif
    }

    /// Checks if the current platform is macOS.
    ///
    /// - Returns: `true` if the platform is macOS, `false` otherwise.
    public static func isMac() -> Bool {
        #if os(OSX)
            return true
        #else
            return false
        #endif
    }
}

// MARK: - File System
extension Utils {
    /// Gets the documents directory URL.
    ///
    /// - Returns: The URL of the documents directory.
    public static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}
