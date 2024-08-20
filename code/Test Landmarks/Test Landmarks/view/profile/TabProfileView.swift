import SwiftUI

struct TabProfileView: View {
    @ObservedObject var profileVm: ProfileViewModel

    var body: some View {
        NavigationStack {
            VStack {
                if profileVm.favorites.isEmpty {
                    Text("No favorites yet!")
                } else {
                    List(profileVm.favorites) { landmark in
                        LandmarkListRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Favorites")
            .toolbar {
                Button {
                    // Navigate to a user profile view!
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
        }
    }
}

