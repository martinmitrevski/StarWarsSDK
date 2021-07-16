import Foundation

/// Endpoint for the StarWars endpoint.
enum StarWarsEndpoint: String {
    
    private var baseURL: String {
        "https://swapi.dev/api/"
    }

    /// The people endpoint.
    case people
    /// The planets endpoint.
    case planets
    /// The films endpoint.
    case films
    
}


extension StarWarsEndpoint {
    
    /// Returns the endpoint url.
    var url: String {
        return baseURL + self.rawValue
    }
    
}
