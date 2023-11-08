import SwiftUI

struct BookView: View {
    
    private var book = Book()
    
    var body: some View {
        Text("Hello, Book!")
        Button("start") {
            book.onLiveActivity()
        }
        Button("stop") {
            book.offLiveActivity()
        }
    }
}

#Preview {
    ContentView()
}
