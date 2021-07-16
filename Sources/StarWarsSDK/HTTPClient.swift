import Foundation
import Combine

/// HTTP client for executing requests.
protocol HTTPClient {
    
    /// Executes a request.
    ///
    /// - Parameters:
    ///   - request, the request to be executed.
    /// - Returns: future with the parsed object or an error.
    func executeRequest<T>(request: URLRequest) -> Future<T, Error> where T: Decodable
    
    /// Executes a GET request.
    ///
    /// - Parameters:
    ///   - url, the url of the request.
    /// - Returns: future with the parsed object or an error.
    func get<T>(from url: URL) -> Future<T, Error> where T: Decodable
    
}

/// Implementation of `HTTPClient`.
class StandardHTTPClient: HTTPClient {
    
    fileprivate let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func executeRequest<T>(request: URLRequest) -> Future<T, Error> where T: Decodable {
        return Future<T, Error> { [unowned self] promise in
            self.urlSession.dataTask(with: request) { (data, urlResponse, error) in
                if let error = error {
                    promise(.failure(error))
                    return
                }
                if let data = data {
                    do {
                        let model = try JSONDecoder().decode(T.self, from: data)
                        promise(.success(model))
                        return
                    } catch {
                        print("Error parsing the response")
                        promise(.failure(error))
                        return
                    }
                }
                
                if let httpResponse = urlResponse as? HTTPURLResponse {
                    let error = StarWarsError.networkError(code: httpResponse.statusCode)
                    promise(.failure(error))
                    return
                }
                
                promise(.failure(StarWarsError.unknown))
            }
            .resume()
        }
    }
    
    func get<T>(from url: URL) -> Future<T, Error> where T: Decodable {
        let request = URLRequest(url: url)
        return executeRequest(request: request)
    }
    
}
