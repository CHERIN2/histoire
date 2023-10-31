import SwiftUI

@main
struct histoireApp: App {
    var body: some Scene {
        WindowGroup {
            TabbarView()
            ChatView()
            HomeView()
            ProfileView()
        }
    }
}
