import Foundation

/// The response for the planets.
struct PlanetsResponse: Decodable {
    
    /// List of planet results.
    let results: [PlanetInfo]
    
}
