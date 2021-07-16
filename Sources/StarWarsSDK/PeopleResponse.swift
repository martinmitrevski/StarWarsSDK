import Foundation

/// Represents the people's response.
struct PeopleResponse: Decodable {
    
    /// List of results with people's color info.
    let results: [EyeColorInfo]
    
}
