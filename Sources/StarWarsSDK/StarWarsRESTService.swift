import Foundation
import Combine

class StarWarsRESTService: StarWarsService {
    
    private let httpClient: HTTPClient
    private let dateFormatter = DateFormatter()
        
    init(httpClient: HTTPClient = StandardHTTPClient()) {
        self.httpClient = httpClient
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    
    func eyeColor(numberOfPeople: Int) -> AnyPublisher<[EyeColorInfo], Error> {
        let request: AnyPublisher<PeopleResponse, Error> = executeRequest(urlString: StarWarsEndpoint.people.url)
        return request.map { response in
            Array(response.results.map { response in
                EyeColorInfo(name: response.name, color: response.color)
            }
            .prefix(numberOfPeople))
        }
        .eraseToAnyPublisher()
    }
    
    func planetInformation(numberOfPlanets: Int) -> AnyPublisher<[PlanetInfo], Error> {
        let request: AnyPublisher<PlanetsResponse, Error> = executeRequest(urlString: StarWarsEndpoint.planets.url)
        return request.map { response in
            Array(response.results.map { response in
                PlanetInfo(name: response.name,
                           population: response.population,
                           climate: response.climate)
            }
            .prefix(numberOfPlanets))
        }
        .eraseToAnyPublisher()
    }
    
    func allFilms() -> AnyPublisher<[Film], Error> {
        let request: AnyPublisher<FilmsResponse, Error> = executeRequest(urlString: StarWarsEndpoint.films.url)
        return request.map { response in
            response.results.compactMap { [weak self] response in
                if let date = self?.dateFormatter.date(from: response.releaseDate) {
                    let year = date.get(.year)
                    return Film(title: response.title, openingCrawl: response.openingCrawl, year: year)
                } else {
                    return nil
                }
            }
        }
        .eraseToAnyPublisher()
    }
    
    //MARK: - private
    
    private func executeRequest<T>(urlString: String) -> AnyPublisher<T, Error> where T: Decodable {
        guard let url = URL(string: urlString) else {
            return StarWarsError.invalidURL.resolve()
        }

        return httpClient.get(from: url).eraseToAnyPublisher()
    }
    
}

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}
