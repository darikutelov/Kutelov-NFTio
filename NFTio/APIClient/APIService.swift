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
                                     bodyData: T,
                                     authToken: String?) async throws -> T? {
        var encodedBodyData: Data
        var response: URLResponse
        var data: Data
        
        guard let url = requestUrl.url else {
            throw APIServiceError.failedToCreateUrl
        }
        
        /// Create post request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        /// Attach auth token for the server
        if let token = authToken {
            request.setValue(token, forHTTPHeaderField: "x-access-token")
        }
        
        /// Encode and send tata to the server
        do {
            encodedBodyData = try encoder.encode(bodyData)
            request.httpBody = encodedBodyData
            (data, response) = try await session.data(for: request)
            
        } catch {
            throw APIServiceError.failedToConnectToServer("Failed to send data to the server!")
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode)
        else {
            throw APIServiceError.invalidResponse
        }
        
        /// Decode data returned from the server
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            throw APIServiceError.responseDecodingFailed("Error in decoding data!")
        }

        /// If post type is User (register, login) get auth token from the cookie and attach it to the user instance
        if let token = getAuthToken(),
           var user = decodedData as? User {
            user.authToken = token
            
            return user as? T
        }
        
        return decodedData
    }
    
    private func getAuthToken() -> String? {
        guard let cookies = HTTPCookieStorage.shared.cookies else {
            return nil
        }
        
        guard let authCookie = cookies.first(where: { $0.name == Constants.Api.authTokenCookieName }) else {
            return nil
        }
        
        return authCookie.value
    }
}
