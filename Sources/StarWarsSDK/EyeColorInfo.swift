import Foundation

/// Model for the color information for people.
public struct EyeColorInfo: Codable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case color = "eye_color"
    }
    
    /// Name of the person.
    public let name: String
    /// The eye color of the person.
    public let color: String
    
    public var id: String {
        return "\(name)-\(color)"
    }
    
}
