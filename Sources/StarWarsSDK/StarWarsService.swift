import Foundation
import Combine

/// Service for loading StarWars related information.
protocol StarWarsService {
    
    /// Returns eye color for number of people.
    ///
    /// - Parameters:
    ///   - numberOfPeople, the number of people to be retrieved.
    /// - Returns: publisher with `[EyeColorInfo]`, or an error.
    func eyeColor(numberOfPeople: Int) -> AnyPublisher<[EyeColorInfo], Error>
    
    /// Returns planet information for number of planets.
    ///
    /// - Parameters:
    ///   - numberOfPlanets, the number of planets to be retrieved.
    /// - Returns: publisher with `[PlanetInfo]`, or an error.
    func planetInformation(numberOfPlanets: Int) -> AnyPublisher<[PlanetInfo], Error>
    
    /// Returns all `[Films]`, or an error.
    func allFilms() -> AnyPublisher<[Film], Error>
    
}
