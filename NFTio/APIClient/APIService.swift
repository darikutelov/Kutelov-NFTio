//
//  Service.swift
//  NFTio
//
//  Created by Dariy Kutelov on 8.04.23.
//

import Foundation

/// API Errors
enum APIServiceError: Error {
    case failedToCreateUrl
    case requestFailed
    case responseDecodingFailed(String)
    case failedToConnectToServer(String)
    case objectEncodingFailed
    case invalidResponse
}

/// Primary API Service object to get app's data
final class APIService {
    static let shared = APIService()
    private let session: URLSession
    private let sessionConfiguration: URLSessionConfiguration
    private var decoder: JSONDecoder
    private var encoder: JSONEncoder
    
    /// Init
    private init() {
        self.sessionConfiguration = URLSessionConfiguration.default
        self.session = URLSession(configuration: sessionConfiguration)
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        
        setUpCoders()
    }
    
    private func setUpCoders() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        encoder.outputFormatting = .prettyPrinted
    }
    
    public func fetchData<T: Codable>(_ requestUrl: RequestUrl,
                                      expecting type: T.Type) async throws -> T {
        var data: Data
        var response: URLResponse
        
        guard let url = requestUrl.url else {
            throw APIServiceError.failedToCreateUrl
        }
        
        do {
            (data, response) = try await session.data(from: url)
        } catch {
            Log.error.error("Failed to connect to the server!")
            throw APIServiceError.failedToConnectToServer("Failed to connect to the server!")
        }
        
        // Week 09: Assignment 1
        Log.info.debug("Data downloaded: \(data.description)")
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw APIServiceError.requestFailed
        }
        
        guard let decodedData = try? decoder.decode(type.self, from: data) else {
            throw APIServiceError.responseDecodingFailed("Error in decoding data!")
        }
        
        return decodedData
    }
    
    public func saveData<T: Codable>(_ requestUrl: RequestUrl,
                                     data: T) async throws {
        var bodyData: Data
        var response: URLResponse
        
        guard let url = requestUrl.url else {
            throw APIServiceError.failedToCreateUrl
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            bodyData = try encoder.encode(data)
        } catch {
            throw APIServiceError.objectEncodingFailed
        }
        
        do {
            (_, response) = try await session.upload(for: request, from: bodyData)
        } catch {
            throw APIServiceError.failedToConnectToServer("Failed to connect to the server!")
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            throw APIServiceError.invalidResponse
        }
    }
}
