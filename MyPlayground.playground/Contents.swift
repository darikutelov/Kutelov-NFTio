import Foundation
import SwiftUI

enum APIError: Error {
    case failedToCreateUrl
    case failedToConnectToServer
    case noDataFetched
}

func fetchData<T: Codable>(url requestUrl: URL,
                           expecting type: T.Type,
                           completion: @escaping (Result<T, Error>) -> Void) {
    
    guard let urlRequest = request(from: requestUrl) else {
        completion(.failure(APIError.failedToCreateUrl))
        return
    }
    
    let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
        
        guard let cookies = HTTPCookieStorage.shared.cookies else {
            return
        }
        
        print(String(describing: cookies))
        
        cookies.forEach {
            print("Cookie name: \($0.name), Cookie value: \($0.value)")
        }
        
        guard let data = data, error == nil else {
            completion(.failure(error ?? APIError.failedToConnectToServer))
            return
        }
        
        let result = String(data: data, encoding: .utf8)
        if let returnResult = result as? T {
            completion(.success(returnResult))
            return
        }
        
        completion(.failure(APIError.noDataFetched))
        
    }
    
    task.resume()
}

func request(from requestUrl: URL) -> URLRequest? {
    var request = URLRequest(url: requestUrl)
    request.httpMethod = "GET"
    return request
}

if let url = URL(string: "https://www.kodeco.com/home") {
    fetchData(url: url, expecting: String.self) { result in
        switch result {
        case .success(let responseModel):
            print(responseModel)
        case .failure(let error):
            print(error)
        }
    }
}



