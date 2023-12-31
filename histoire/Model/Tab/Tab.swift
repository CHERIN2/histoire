import SwiftUI

//MARK: - Tab's
enum Tab: String, CaseIterable {
    case feed = "list.bullet.indent"
    case book = "book.pages"
    case chat = "bubble.left.and.text.bubble.right"
    case profiles = "person.crop.circle"
    
    var title: String {
           switch self {
           case .feed:
               return "Feed"
           case .book:
               return "Book"
           case .chat:
               return "Chat"
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
