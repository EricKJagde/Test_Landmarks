import SwiftUI

//############################################################################
struct TabHomeViewLoadable: View {
    @ObservedObject var homeVm: HomeViewModel
    @ObservedObject var profileVm: ProfileViewModel

    var body: some View {
        switch homeVm.state {
        case .success:
            TabHomeView(homeVm: homeVm, profileVm: profileVm)
        case .failure:
            Text("Error loading!")
        default:
            ProgressView()
                .task {
                    if homeVm.state == .notStarted {
                        homeVm.state = .inProgress
                        await homeVm.load()
                    }
                }
        }
    }
}

//############################################################################
struct TabHomeView: View {
    @ObservedObject var homeVm: HomeViewModel
    @ObservedObject var profileVm: ProfileViewModel

    // A State affects the UI - val changes triggers a UI update
    @State var navPath = NavigationPath()  // Stores the nav state (as a list)

    var body: some View {
        NavigationStack(path: $navPath) {
            List {
                ForEach(homeVm.categories.keys.sorted(), id: \.self) { key in
                    CategoryRowView(categoryName: key, items: homeVm.categories[key]!)
                }
            }
            .navigationTitle("Featured")
            .navigationDestination(for: LandmarkModel.self) { landmark in
                LandmarkDetailView(profileVm: profileVm, landmark: landmark)
            }
            // ADD NEW VIEWS TO YOUR LIKING HERE W/ .navigationDestination(for: ...)
        }
    }
}

//############################################################################
struct LandmarkListRow: View {
    var landmark: LandmarkModel

    var body: some View {
        HStack {
            Image(landmark.imageName)
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)

            Spacer()
        }
    }
}

