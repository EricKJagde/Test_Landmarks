import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var model: ProfileModel = ProfileModel()

    var favorites: [LandmarkModel] {
        return model.favorites
    }

    func toggleFavorite(_ landmark: LandmarkModel) async -> Void {
        await MainActor.run { model.toggleFavorite(landmark) }
    }
}

