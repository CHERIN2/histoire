import SwiftUI

struct PositionKey: PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}

extension View {
    @ViewBuilder
    func viewPosition(completion: @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader {
                    let ract = $0.frame(in: .global)
                    
                    Color.clear
                        .preference(key: PositionKey.self, value: ract)
                        .onPreferenceChange(PositionKey.self, perform: completion)
                }
            }
    }
}
