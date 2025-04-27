//
//  DirectoriesHelper.swift
//  UtilityCoreKit
//
//  Created by Ofir Ron on 21/04/2025.
//

import Foundation

public struct DirectoriesHelper {
    public static let documentsDirectoryURL: URL = {
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }()
}
