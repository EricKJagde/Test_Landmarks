import SwiftUI

struct LandmarkDetailView: View {
    @ObservedObject var profileVm: ProfileViewModel

    var landmark: LandmarkModel

    @State var isFavorited: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)

                CircleImage(imageName: landmark.imageName)
                    .offset(y: -130)
                    .padding(.bottom, -130)

                VStack(alignment: .leading) {
                    HStack {
                        Text(landmark.name)
                            .font(.title)
                        Button(action: {
                            Task { await profileVm.toggleFavorite(landmark) }
                            isFavorited.toggle()
                        }) {
                            Image(systemName: isFavorited ? "star.fill" : "star")
                        }
                        Spacer()
                    }

                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    
                    Divider()

                    Text("About")
                        .font(.title2)
                    Text(landmark.description)
                }
                .padding()

                Spacer()
            }
        }
    }
}

