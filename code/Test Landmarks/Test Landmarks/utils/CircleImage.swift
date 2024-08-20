import SwiftUI

struct CircleImage: View {
    var imageName: String
    var body: some View {
        Image(imageName)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}
