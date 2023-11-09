import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack(spacing: 25) {
            HStack {
                Text("histoire")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundStyle(.black)
                Spacer(minLength: 0)
            }
        }
        .background(.white)
        .padding()
    }
}

#Preview {
    FeedView()
}
