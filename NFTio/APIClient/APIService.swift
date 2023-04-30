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
    case requestFailed(String)
    case responseDecodingFailed(String)
    case failedToConnectToServer(String)
    case objectEncodingFailed
    case invalidResponse(String)
}

/// Primary API Service object to get app's data
final class APIService {
    
    // MARK: - Properties
    
    public static let shared = APIService()
    public static var authToken: String?
    private let session: URLSession
    private let sessionConfiguration: URLSessionConfiguration
    private var decoder: JSONDecoder
    private var encoder: JSONEncoder
    private var cookieStorage: HTTPCookieStorage?
    
    // MARK: - Init
    
    private init() {
        self.sessionConfiguration = URLSessionConfiguration.default
        self.session = URLSession(configuration: sessionConfiguration)
        self.cookieStorage = session.configuration.httpCookieStorage
        decoder = JSONDecoder()
        encoder = JSONEncoder()
        setUpCoders()
    }
    
    /// Sets date format to coders
    private func setUpCoders() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        encoder.dateEncodingStrategy = .formatted(dateFormatter)
        encoder.outputFormatting = .prettyPrinted
    }
    
    ///  Universal function to fech any data type for the project needs
    public func fetchData<T: Codable>(_ requestUrl: RequestUrl,
                                      expecting type: T.Type) async throws -> T {
        var data: Data
        var response: URLResponse
        
        guard let url = requestUrl.url else {
            throw APIServiceError.failedToCreateUrl
        }
        
        do {
            (data, response) = try await session.data(from: url)
        } catch let error {
            try handleServerError(error)
            throw APIServiceError.failedToConnectToServer(
                Constants.Text.ErrorMessages.BadConnection
            )
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw APIServiceError.requestFailed(Constants.Text.ErrorMessages.badRequest)
        }
        
        guard let decodedData = try? decoder.decode(type.self, from: data) else {
            throw APIServiceError.responseDecodingFailed(
                Constants.Text.ErrorMessages.decodingError
            )
        }
        
        return decodedData
    }
    
    ///  Universal function to post any data type for the project needs
    public func postData<T: Codable>(_ requestUrl: RequestUrl,
                                     bodyData: T) async throws -> T? {
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
        if let token = Self.authToken,
           !url.pathComponents.contains("login"),
           !url.pathComponents.contains("register") {
            request.setValue(token, forHTTPHeaderField: "x-access-token")
        }
        
        /// Encode and send tata to the server
        do {
            encodedBodyData = try encoder.encode(bodyData)
            request.httpBody = encodedBodyData
            (data, response) = try await session.data(for: request)
        } catch let error {
            print(error)
            // Handles URLError errors: no connection and server is down
            try handleServerError(error)
            
            // Fallback for non URLErrors
            throw APIServiceError.failedToConnectToServer(
                Constants.Text.ErrorMessages.BadConnection
            )
        }
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIServiceError.invalidResponse(
                Constants.Text.ErrorMessages.responseError
            )
        }
        
        guard (200..<300).contains(httpResponse.statusCode) else {
            let serverErrorMessage = String(data: data, encoding: .utf8)
            throw APIServiceError.invalidResponse(
                serverErrorMessage ?? Constants.Text.ErrorMessages.badRequest
            )
        }
        
        // Decode data returned from the server
        guard let decodedData = try? decoder.decode(T.self, from: data) else {
            throw APIServiceError.responseDecodingFailed(
                Constants.Text.ErrorMessages.decodingError
            )
        }
        
        // If post type is User (register, login) get auth token from the cookie and attach it to the user instance
        if let token = getAuthToken(),
           var user = decodedData as? User {
            Self.authToken = token
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
    
    // Handles URLError errors: no connection and server is down
    private func handleServerError(_ error: Error) throws {
        if let error = error as? URLError {
            switch error.code {
            // Error is triggered if there is no internet connection when the request is made
            case .notConnectedToInternet:
                print(Constants.Text.ErrorMessages.noInternetConnection)
                throw APIServiceError.failedToConnectToServer(
                    Constants.Text.ErrorMessages.noInternetConnection
                )
            // Error is triggered when the server is down
            case .cannotConnectToHost:
                print(Constants.Text.ErrorMessages.noConnectionWithHost)
                throw APIServiceError.failedToConnectToServer(
                    Constants.Text.ErrorMessages.noConnectionWithHost
                )
            default:
                print(Constants.Text.ErrorMessages.BadConnection)
                throw APIServiceError.failedToConnectToServer(
                    Constants.Text.ErrorMessages.BadConnection
                )
            }
        }
    }
}

extension APIService {
    func uploadImage(imageData: Data, requestUrl: RequestUrl) async throws -> String? {
        var response: URLResponse
        var data: Data
        
        guard let url = requestUrl.url else {
            throw APIServiceError.failedToCreateUrl
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let boundary = UUID().uuidString
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let body = NSMutableData()
        
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"nft\"; filename=\"\(UUID().uuidString).jpg\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!)
        body.append(imageData)
        body.append("\r\n".data(using: .utf8)!)
        body.append("--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = body as Data
        
        do {
            (data, response) = try await session.data(for: request)
        } catch let error {
            try handleServerError(error)
            
            throw APIServiceError.failedToConnectToServer(
                Constants.Text.ErrorMessages.imageUploadFailed
            )
        }
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw APIServiceError.requestFailed(Constants.Text.ErrorMessages.badRequest)
        }
        
        struct FileName: Codable {
            let fileName: String
        }
        
        guard let decodedData = try? decoder.decode(FileName.self, from: data) else {
            throw APIServiceError.responseDecodingFailed(
                Constants.Text.ErrorMessages.decodingError
            )
        }
  
        return decodedData.fileName
    }
}
