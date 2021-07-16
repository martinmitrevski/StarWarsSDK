import Foundation

/// Model for the films.
public struct Film: Codable, Identifiable {
        
    /// The movie title.
    public let title: String
    /// The movie's opening crawl.
    public let openingCrawl: String
    /// The year when the movie was released.
    public let year: Int
    
    public var id: String {
        "\(title)-\(openingCrawl)-\(year)"
    }
}
