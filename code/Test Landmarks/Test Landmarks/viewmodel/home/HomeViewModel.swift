import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var model: HomeModel = HomeModel()

    init() {
        self.loadFromFileJSON()
    }

    var landmarks: [LandmarkModel] {
        return model.landmarks
    }

    var categories: [String: [LandmarkModel]] {
        return Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }

    func loadFromFileJSON() -> Void {
        let landmarks: [LandmarkModel] = Test_Landmarks.load("landmarkData.json")
        self.model.landmarks = landmarks
    }

    @Published var state: ViewModelState = .notStarted

    func load() async -> Void {
        // NOTE: Updates to Published variables must occur on the main thread

        await MainActor.run { self.state = .inProgress }

        // Perform an API request to the backend server
        // We would get JSON data
        // Let's just load the JSON data from file that we have already

        // Sleep for 2 sec to simulate a network call
        //try? await Task.sleep(nanoseconds: 2_000_000_000)
        await MainActor.run { self.loadFromFileJSON() }

        await MainActor.run { self.state = .success }
    }
}

