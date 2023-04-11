//
//  Request.swift
//  NFTio
//
//  Created by Dariy Kutelov on 8.04.23.
//

import Foundation

/// Object that represents single API call
final class RequestUrl {
    /// Desired endpoint
    private let endpoint: Endpoint
    
    /// Path components like item id, order id, etc
    private let pathComponents: [String]
    
    /// Path components for API
    private let queryParameters: [URLQueryItem]
    
    /// Constructed url for API request in string format
    private var urlString: String {
        var stringUrl = Constants.Api.baseUrl + endpoint.rawValue
        
        // Asignment 3
        if endpoint.rawValue == "collections" {
            stringUrl = Constants.Api.baseUnsecureUrl + endpoint.rawValue
        }
        
        if !pathComponents.isEmpty {
            pathComponents.forEach {
                stringUrl += "/\($0)"
            }
        }
        
        if !queryParameters.isEmpty {
            stringUrl += "?"
            let queryParamsString = queryParameters.compactMap({
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }).joined(separator: "&")
            
            stringUrl += queryParamsString
        }
        
        return stringUrl
    }
    
    /// API url
    public var url: URL? {
        return URL(string: urlString)
    }
    
    // - MARK: - Init
    
    public init(endpoint: Endpoint,
                pathComponents: [String] = [],
                queryParameters: [URLQueryItem] = []) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
}
