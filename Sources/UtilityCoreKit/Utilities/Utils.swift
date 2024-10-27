//
//  Utils.swift
//
//
//  Created by Ofir Ron on 27/10/2024.
//

import Foundation

// MARK: - Utils
public struct Utils {}

// MARK: - Threads
extension Utils {
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

// MARK: - OS
extension Utils {
    public static func isIOS() -> Bool {
        #if os(iOS)
            return true
        #else
            return false
        #endif
    }

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
    public static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}
