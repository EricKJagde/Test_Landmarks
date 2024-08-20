import Foundation

struct ProfileModel {
    var favorites: [LandmarkModel] = []

    mutating func toggleFavorite(_ landmark: LandmarkModel) -> Void {
        let names = favorites.map { $0.name }
        if names.contains(landmark.name) {
            favorites.removeAll { $0.name == landmark.name }
        } else {
            favorites.append(landmark)
            favorites.sort { $0.name < $1.name }
        }
    }
}
