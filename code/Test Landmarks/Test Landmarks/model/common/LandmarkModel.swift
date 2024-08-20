import CoreLocation  // Support CLLocationCoordinate2D
import Foundation

// Hashable: Implements hashing protocol
// Codable: Enables JSON encoding/decoding
struct LandmarkModel: Identifiable, Hashable, Codable {
    var id: Int  // Needed to implement Hashable
    var name: String
    var park: String
    var state: String
    var description: String
    var imageName: String

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    var category: Category
    enum Category: String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
}

