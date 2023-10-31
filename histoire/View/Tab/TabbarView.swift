import SwiftUI

struct TabbarView: View {
    //MARK: - View Properties
    @State private var activeTab: Tab = .home
    @Namespace private var animation
    @State private var tabShapePosition: CGPoint = .zero
    init() {
        //MARK: - hiding tab bar due to iOS 16 bug
        UITabBar.appearance().isHidden = true
    }
    
    //MARK: - All Tab's
    @State private var allTabs: [AnimatedTab] = Tab.allCases.compactMap { tab -> AnimatedTab? in
        return .init(tab: tab)
    }
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                
                FeedView()
                    .tabItem {
                        Text("Feed")
                            .tag(Tab.feed)
                    }
                ChetView()
                    .tabItem {
                        Text("Chat")
                            .tag(Tab.chat)
                    }
                
                HomeView()
                    .tabItem {
                        Text("Home")
                            .tag(Tab.home)
                    }
                
                Text("Notifications")
                    .tag(Tab.notifications)
                
                Text("ProFiles")
                    .tag(Tab.profiles)
            }
            CustomTabBar()
        }
    }
    
    //MARK: - Custom Tab Bar
    func CustomTabBar(_ tint: Color = Color(.blue), _ inactiveTint: Color = .blue) -> some View {
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(
                    tint: tint,
                    inactiveTint: inactiveTint,
                    tab: $0,
                    animation: animation,
                    activeTab: $activeTab,
                    position: $tabShapePosition
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(content: {
            TabShape(midPoint: tabShapePosition.x)
                .fill(.white)
                .ignoresSafeArea()
            //MARK: - add blur + shadow
                .shadow(color: tint.opacity(0.2), radius: 5, x: 0, y: -5)
                .blur(radius: 2)
                .padding(.top, 25)
            
        })
        //MARK: - Tab Animation
        .animation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7), value: activeTab)
    }
}


struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    var animation: Namespace.ID
    @Binding var activeTab: Tab
    @Binding var position: CGPoint
    
    @State private var tabPosition: CGPoint = .zero
    var body: some View {
        VStack(spacing: 5) {
            Image(systemName: tab.rawValue)
                .font(.title2)
                .foregroundColor(activeTab == tab ? .white : inactiveTint)
                .frame(width: activeTab == tab ? 58 : 35, height: activeTab == tab ? 58 : 35)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
                            .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                    }
                }
            
            Text(tab.title)
                .font(.caption)
                .foregroundStyle(activeTab == tab ? tint : .gray)
        }
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .viewPosition(completion: { rect in
            tabPosition.x = rect.midX
            
            if activeTab == tab {
                position.x = rect.midX
            }
        })
        .onTapGesture {
            activeTab = tab
            
            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.7, blendDuration: 0.7)) {
                position.x = tabPosition.x
            }
        }
    }
}

#Preview {
    ContentView()
}

extension View {
    @ViewBuilder
    func setUpTab(_ tab: Tab) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}
