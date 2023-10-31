import SwiftUI

//MARK: - Tab's
enum Tab: String, CaseIterable {
    case chat = "bubble.left.and.text.bubble.right"
    case home = "house"
    case profiles = "person.2.crop.square.stack.fill"
    
    var title: String {
        switch self {
        case .chat:
            return "Chat"
        case .home:
            return "home"
        case .profiles:
            return "Profiles"
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}


//MARK: - Animated SF Tab Model
struct AnimatedTab: Identifiable {
    var id: UUID = .init()
    var tab: Tab
    var isAnimateing: Bool?
}
