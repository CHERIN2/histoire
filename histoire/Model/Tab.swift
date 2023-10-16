import SwiftUI

//MARK: - Tab's
enum Tab: String, CaseIterable {
    case feed = "list.star"
    case chat = "bubble.left.and.text.bubble.right"
    case home = "house"
    case notifications = "bell.and.waves.left.and.right"
    case profiles = "person.2.crop.square.stack.fill"
    
    var title: String {
        switch self {
        case .feed:
            return "Feed"
        case .chat:
            return "Chat"
        case .home:
            return "Home"
        case .notifications:
            return "Notifications"
        case .profiles:
            return "Profiles"
        }
    }
}


//MARK: - Animated SF Tab Model
struct AnimatedTab: Identifiable {
    var id: UUID = .init()
    var tab: Tab
    var isAnimateing: Bool?
}
