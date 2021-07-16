import Foundation
import Combine

/// Singleton instance for interacting with the SDK.
public class StarWars {
    
    public static let shared = StarWars()
    
    private let starWarsService: StarWarsService = StarWarsRESTService()
    
    /// Returns eye color for five different people.
    public func eyeColorForFivePeople() -> AnyPublisher<[EyeColorInfo], Error> {
        return starWarsService.eyeColor(numberOfPeople: 5)
    }
    
    /// Returns planet information for five different planets.
    public func planetInformationForFivePlanets() -> AnyPublisher<[PlanetInfo], Error> {
        return starWarsService.planetInformation(numberOfPlanets: 5)
    }
    
    /// Returns all fillms.
    public func allFilms() -> AnyPublisher<[Film], Error> {
        return starWarsService.allFilms()
    }
    
}
