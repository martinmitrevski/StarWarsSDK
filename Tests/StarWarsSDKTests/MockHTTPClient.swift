import Foundation
import Combine
@testable import StarWarsSDK

/// Mock implementation of `HTTPClient`.
class MockHTTPClient: HTTPClient {

    func executeRequest<T>(request: URLRequest) -> Future<T, Error> where T : Decodable {
        return get(from: request.url!)
    }
    
    func get<T>(from url: URL) -> Future<T, Error> where T : Decodable {
        if url.pathComponents.contains("people") {
            return resolve(with: PeopleResponse(results: [EyeColorInfo(name: "Test 1", color: "blue"),
                                                          EyeColorInfo(name: "Test 2", color: "green"),
                                                          EyeColorInfo(name: "Test 3", color: "yellow")]) as! T)
        } else if url.pathComponents.contains("planets") {
            return resolve(with: PlanetsResponse(results: [PlanetInfo(name: "Planet 1", population: "123", climate: "moderate"),
                                                           PlanetInfo(name: "Planet 2", population: "124", climate: "moderate"),
                                                           PlanetInfo(name: "Planet 3", population: "125", climate: "moderate")]) as! T)
        } else {
            return resolve(with: FilmsResponse(results: [FilmResponse(title: "Title 1", openingCrawl: "OC1", releaseDate: "2000-01-01"),
                                                         FilmResponse(title: "Title 2", openingCrawl: "OC2", releaseDate: "2001-01-01"),
                                                         FilmResponse(title: "Title 3", openingCrawl: "OC3", releaseDate: "2002-01-01")]) as! T)
        }
    }
    
    private func resolve<T>(with data: T) -> Future<T, Error> {
        Future { promise in
            promise(.success(data))
        }
    }

}
