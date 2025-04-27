//
//  AssetManager.swift
//  MyLifeHelpingApp
//
//  Created by Ofir Ron on 28/04/2025.
// Helping Grok.
//

import Foundation
import FoundationCoreKit

// MARK: - AssetManager

/// Manages downloading, retrieving, and deleting assets from the internet.
/// Depends on `StorageLocation`, `DownloadableAsset`, and `UncommonError` types defined elsewhere.
public class AssetManager {
    public init() {}
}

// MARK: - Core Download Methods

extension AssetManager {
    /// Downloads a single asset and returns its local URL.
    public func download(asset: DownloadableAsset) async throws -> URL {
        let localURL = try localFileURL(for: asset)
        if FileManager.default.fileExists(atPath: localURL.path) {
            return localURL
        }
        let (tempURL, _) = try await URLSession.shared.download(from: asset.url)
        try FileManager.default.moveItem(at: tempURL, to: localURL)
        return localURL
    }
    
    /// Downloads multiple assets and returns their local URLs.
    public func download(assets: [DownloadableAsset]) async throws -> [URL] {
        var localURLs: [URL] = []
        for asset in assets {
            let localURL = try await download(asset: asset)
            localURLs.append(localURL)
        }
        return localURLs
    }
    
    /// Downloads multiple URLs and returns their local URLs.
    public func download(urls: [URL], to location: StorageLocation = .default) async throws -> [URL] {
        var localURLs: [URL] = []
        for url in urls {
            let localURL = try localFileURL(for: url, location: location)
            if FileManager.default.fileExists(atPath: localURL.path) {
                localURLs.append(localURL)
                continue
            }
            let (tempURL, _) = try await URLSession.shared.download(from: url)
            try FileManager.default.moveItem(at: tempURL, to: localURL)
            localURLs.append(localURL)
        }
        return localURLs
    }
    
    /// Downloads multiple URL strings and returns their local URLs.
    public func download(urlStrings: [String], to location: StorageLocation = .default) async throws -> [URL] {
        let urls = urlStrings.compactMap { URL(string: $0) }
        guard urls.count == urlStrings.count else {
            throw URLError(.badURL)
        }
        return try await download(urls: urls, to: location)
    }
}

// MARK: - Convenience Download Methods

extension AssetManager {
    /// Downloads a single URL and returns its local URL.
    public func download(source url: URL, to location: StorageLocation = .default) async throws -> URL {
        let localURLs = try await download(urls: [url], to: location)
        return localURLs.first!
    }
    
    /// Downloads a single URL string and returns its local URL.
    public func download(source urlString: String, to location: StorageLocation = .default) async throws -> URL {
        let localURLs = try await download(urlStrings: [urlString], to: location)
        return localURLs.first!
    }
    
    /// Downloads a single URL string with optional overrides and returns its local URL.
    public func download(source urlString: String, fileName: String? = nil, fileExtension: String? = nil, to location: StorageLocation = .default) async throws -> URL {
        let asset = try DownloadableAsset(stringURL: urlString, fileName: fileName, fileExtension: fileExtension, location: location)
        return try await download(asset: asset)
    }
}

// MARK: - Utility Methods

extension AssetManager {
    /// Retrieves the local URL for an asset if it exists.
    public func localURL(for asset: DownloadableAsset) throws -> URL? {
        let fileURL = try localFileURL(for: asset)
        return FileManager.default.fileExists(atPath: fileURL.path) ? fileURL : nil
    }
    
    /// Retrieves the local URL for a URL if it exists.
    public func localURL(for url: URL, location: StorageLocation = .default) throws -> URL? {
        let fileURL = try localFileURL(for: url, location: location)
        return FileManager.default.fileExists(atPath: fileURL.path) ? fileURL : nil
    }
    
    /// Deletes an asset from local storage.
    public func delete(asset: DownloadableAsset) throws {
        let localURL = try localFileURL(for: asset)
        if FileManager.default.fileExists(atPath: localURL.path) {
            try FileManager.default.removeItem(at: localURL)
        }
    }
    
    /// Deletes a file associated with a URL from local storage.
    public func delete(url: URL, location: StorageLocation = .default) throws {
        let localURL = try localFileURL(for: url, location: location)
        if FileManager.default.fileExists(atPath: localURL.path) {
            try FileManager.default.removeItem(at: localURL)
        }
    }
    
    /// Constructs a local URL for a given filename and extension.
    public func localURL(for fileName: String, fileExtension: String, location: StorageLocation = .default) -> URL {
        let baseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileName = fileName + "." + fileExtension
        return baseURL.appendingPathComponent(fileName)
    }
}

// MARK: - Private Helpers

extension AssetManager {
    /// Computes the local file URL for an asset.
    private func localFileURL(for asset: DownloadableAsset) throws -> URL {
        let baseURL: URL
        switch asset.location {
        case .documents:
                guard let docBaseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                    throw UncommonError.documentDirectoryNotFound
                }
                
                baseURL = docBaseURL
        }

        let defaultBaseName = asset.url.deletingPathExtension().lastPathComponent
        let defaultExtension = asset.url.pathExtension
        let baseName = asset.fileName ?? defaultBaseName
        let fileExtension = asset.fileExtension ?? defaultExtension
        let fileName = baseName + "." + fileExtension
        return baseURL.appendingPathComponent(fileName)
    }
    
    /// Computes the local file URL for a URL.
    private func localFileURL(for url: URL, location: StorageLocation) throws -> URL {
        let baseURL: URL
        switch location {
        case .documents:
                guard let docBaseURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
                    throw UncommonError.documentDirectoryNotFound
                }
                
                baseURL = docBaseURL
        }

        let baseName = url.deletingPathExtension().lastPathComponent
        let fileExtension = url.pathExtension
        let fileName = baseName + "." + fileExtension
        return baseURL.appendingPathComponent(fileName)
    }
}
