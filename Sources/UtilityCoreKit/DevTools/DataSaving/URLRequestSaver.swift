//
//  URLRequestSaver.swift
//  UtilityCoreKit
//
//  Created by Ofir Ron on 15/01/2025.
//

import Foundation

/// A utility class for saving and loading `URLRequest` objects to and from files.
/// This class serializes `URLRequest` objects into JSON format and stores them in the app's Documents directory by default.
open class URLRequestSaver {
    // MARK: - Properties
    
    /// The directory where files will be saved. Defaults to the app's Documents directory.
    private let directory: URL
    
    // MARK: - Initializer
    
    /// Initializes a `URLRequestSaver` with a specific directory.
    /// - Parameter directory: The directory where files will be saved. Defaults to the app's Documents directory.
    public init(directory: URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!) {
        self.directory = directory
    }
    
    // MARK: - Public Methods
    
    /// Saves a `URLRequest` to a file.
    /// - Parameters:
    ///   - request: The `URLRequest` to save.
    ///   - fileName: The name of the file to save the request to.
    /// - Throws: An error if the request cannot be encoded or the file cannot be written.
    public func save(request: URLRequest, to fileName: String) throws {
        let fileURL = directory.appendingPathComponent(fileName)
        
        // Convert URLRequest to Data
        let requestData = try encodeURLRequest(request)
        
        // Write data to file
        try requestData.write(to: fileURL, options: .atomic)
    }
    
    /// Loads a `URLRequest` from a file.
    /// - Parameter fileName: The name of the file to load the request from.
    /// - Returns: The `URLRequest` loaded from the file.
    /// - Throws: An error if the file cannot be read or the request cannot be decoded.
    @available(*, deprecated, message: "The funciton was not tested yet.")
    public func load(from fileName: String) throws -> URLRequest {
        let fileURL = directory.appendingPathComponent(fileName)
        
        // Read data from file
        let requestData = try Data(contentsOf: fileURL)
        
        // Convert Data to URLRequest
        return try decodeURLRequest(requestData)
    }
    
    /// Deletes a file.
    /// - Parameter fileName: The name of the file to delete.
    /// - Throws: An error if the file cannot be deleted.
    @available(*, deprecated, message: "The funciton was not tested yet.")
    public func delete(fileName: String) throws {
        let fileURL = directory.appendingPathComponent(fileName)
        try FileManager.default.removeItem(at: fileURL)
    }
    
    /// Checks if a file exists.
    /// - Parameter fileName: The name of the file to check.
    /// - Returns: `true` if the file exists, otherwise `false`.
    @available(*, deprecated, message: "The funciton was not tested yet.")
    public func fileExists(fileName: String) -> Bool {
        let fileURL = directory.appendingPathComponent(fileName)
        return FileManager.default.fileExists(atPath: fileURL.path)
    }
    
    // MARK: - Private Methods
    
    /// Encodes a `URLRequest` into `Data` using JSON serialization.
    /// - Parameter request: The `URLRequest` to encode.
    /// - Returns: The encoded `Data`.
    /// - Throws: An error if the request cannot be encoded.
    private func encodeURLRequest(_ request: URLRequest) throws -> Data {
        let requestDict: [String: Any?] = [
            "url": request.url?.absoluteString,
            "httpMethod": request.httpMethod,
            "headers": request.allHTTPHeaderFields,
            "body": request.httpBody?.base64EncodedString(),
            "cachePolicy": request.cachePolicy.rawValue,
            "timeoutInterval": request.timeoutInterval
        ]
        
        // Convert dictionary to JSON data
        return try JSONSerialization.data(withJSONObject: requestDict.compactMapValues { $0 }, options: .prettyPrinted)
    }
    
    /// Decodes `Data` into a `URLRequest` using JSON deserialization.
    /// - Parameter data: The `Data` to decode.
    /// - Returns: The decoded `URLRequest`.
    /// - Throws: An error if the data cannot be decoded or the request is invalid.
    @available(*, deprecated, message: "The funciton was not tested yet.")
    private func decodeURLRequest(_ data: Data) throws -> URLRequest {
        // Convert JSON data to dictionary
        let requestDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        
        guard let urlString = requestDict?["url"] as? String,
              let url = URL(string: urlString) else {
            throw NSError(domain: "URLRequestSaver", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
        }
        
        // Create URLRequest
        var request = URLRequest(url: url)
        request.httpMethod = requestDict?["httpMethod"] as? String
        request.allHTTPHeaderFields = requestDict?["headers"] as? [String: String]
        
        if let bodyBase64 = requestDict?["body"] as? String,
           let bodyData = Data(base64Encoded: bodyBase64) {
            request.httpBody = bodyData
        }
        
        if let cachePolicyRawValue = requestDict?["cachePolicy"] as? UInt,
           let cachePolicy = URLRequest.CachePolicy(rawValue: cachePolicyRawValue) {
            request.cachePolicy = cachePolicy
        }
        
        if let timeoutInterval = requestDict?["timeoutInterval"] as? TimeInterval {
            request.timeoutInterval = timeoutInterval
        }
        
        return request
    }
}
