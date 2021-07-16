import Foundation
import Combine

/// Errors thrown by the SDK.
public struct StarWarsError: Error {
    
    /// The specific error code.
    let errorCode: StarWarsErrorCode
    
    /// The additional error message description.
    let description: String?
    
    /// The additional information dictionary.
    let additionalInfo: [String: Any]?

}

/// Error codes supported by the SDK.
public enum StarWarsErrorCode: Int {
    case unknown = 101000
    case networkError = 101001
    case parsingError = 101002
    case invalidURL = 1010003
}

extension StarWarsError {
    
    /// Unknown error.
    static let unknown = StarWarsError(errorCode: .unknown,
                                       description: "Unknown error",
                                       additionalInfo: nil)
    
    /// Network error.
    static func networkError(code: Int) -> StarWarsError {
        return StarWarsError(errorCode: .networkError,
                             description: "Network error",
                             additionalInfo: ["statusCode": code])
    }
    
    /// Parsing error.
    static let parsingError = StarWarsError(errorCode: .parsingError,
                                            description: "Parsing error",
                                            additionalInfo: nil)
    
    /// Invalid url error.
    static let invalidURL = StarWarsError(errorCode: .invalidURL,
                                          description: "Invalid url",
                                          additionalInfo: nil)
    
}

extension StarWarsError {
    
    /// Returns error publisher from the `StarWarsError`.
    func resolve<T>() -> AnyPublisher<T, Error> {
        Fail.init(error: self).eraseToAnyPublisher()
    }
    
}
