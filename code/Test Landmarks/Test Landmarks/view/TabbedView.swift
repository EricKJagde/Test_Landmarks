import SwiftUI

enum AppTab: Int {
    case home
    case profile
}

struct TabbedView: View {
    @StateObject var homeVm = HomeViewModel()
    @StateObject var profileVm = ProfileViewModel()

    @State private var tabSelection: AppTab = .home

    var body: some View {
        TabView(selection: $tabSelection) {
            TabHomeViewLoadable(homeVm: homeVm, profileVm: profileVm)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(AppTab.home.rawValue)

            TabProfileView(profileVm: profileVm)
                .tabItem {
                    Image(systemName: "person")
                    Text("Favorites")
                }
                .tag(AppTab.profile.rawValue)
        }
    }
}

