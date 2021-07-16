import Foundation

/// Model for the planet info.
public struct PlanetInfo: Codable, Identifiable {
    
    /// Name of the planet.
    public let name: String
    /// Population of the planet.
    public let population: String
    /// The planet's climate.
    public let climate: String
    
    public var id: String {
        "\(name)-\(population)-\(climate)"
    }
}
