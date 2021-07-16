import XCTest
import Combine
@testable import StarWarsSDK

class StarWarsSDKTests: XCTestCase {
    
    private var cancellables = Set<AnyCancellable>()

    func testLoadingPlanets() {
        // Given
        let httpClient = MockHTTPClient()
        let service = StarWarsRESTService(httpClient: httpClient)
        
        // When
        service.planetInformation(numberOfPlanets: 5)
            .sink { completion in
                print("finished loading planets")
            } receiveValue: { planets in
                // Then
                XCTAssert(planets.count == 3)
                XCTAssert(planets.first!.name == "Planet 1")
                XCTAssert(planets.first!.population == "123")
                XCTAssert(planets.first!.climate == "moderate")
            }
            .store(in: &cancellables)
    }
    
    func testLoadingPeople() {
        // Given
        let httpClient = MockHTTPClient()
        let service = StarWarsRESTService(httpClient: httpClient)
        
        // When
        service.eyeColor(numberOfPeople: 5)
            .sink { completion in
                print("finished loading people")
            } receiveValue: { planets in
                // Then
                XCTAssert(planets.count == 3)
                XCTAssert(planets.first!.name == "Test 1")
                XCTAssert(planets.first!.color == "blue")
            }
            .store(in: &cancellables)
    }
    
    func testLoadingFilms() {
        // Given
        let httpClient = MockHTTPClient()
        let service = StarWarsRESTService(httpClient: httpClient)
        
        // When
        service.allFilms()
            .sink { completion in
                print("finished loading films")
            } receiveValue: { planets in
                // Then
                XCTAssert(planets.count == 3)
                XCTAssert(planets.first!.title == "Title 1")
                XCTAssert(planets.first!.openingCrawl == "OC1")
                XCTAssert(planets.first!.year == 2000)
            }
            .store(in: &cancellables)
    }

}
