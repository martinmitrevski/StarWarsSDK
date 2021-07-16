import Foundation

/// Represents the films response.
struct FilmsResponse: Decodable {
    
    /// The list of results.
    let results: [FilmResponse]
    
}

/// Represents one film response.
struct FilmResponse: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case openingCrawl = "opening_crawl"
        case releaseDate = "release_date"
    }
    
    /// The title of the film.
    let title: String
    /// The film's opening crawl.
    let openingCrawl: String
    /// The film's release date.
    let releaseDate: String
    
}
