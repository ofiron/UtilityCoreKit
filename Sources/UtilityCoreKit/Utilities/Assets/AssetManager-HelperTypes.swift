//
//  AssetManager-HelperTypes.swift
//  MyLifeHelpingApp
//
//  Created by Ofir Ron on 28/04/2025.
//

import Foundation

// MARK: - StorageLocation
extension AssetManager {
    public enum StorageLocation: Sendable {
        case documents
        
        public static let `default`: StorageLocation = .documents
    }
}

// MARK: - DownloadableAsset
extension AssetManager {
    public struct DownloadableAsset {
        public let url: URL
        public let fileName: String?
        public let fileExtension: String?
        public let location: StorageLocation
        
        public init(url: URL, fileName: String? = nil, fileExtension: String? = nil, location: StorageLocation = .documents) {
            self.url = url
            self.fileName = fileName
            self.fileExtension = fileExtension
            self.location = location
        }
        
        public init(stringURL: String, fileName: String? = nil, fileExtension: String? = nil, location: StorageLocation = .documents) throws {
            let url = try URL(throwing: stringURL)
            self.init(url: url, fileName: fileName, fileExtension: fileExtension, location: location)
        }
    }
}
