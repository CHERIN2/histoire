import SwiftUI

struct BookView: View {
    
    private var book = Book()
    
    var body: some View {
        
        BHeaderView()
        
        Spacer()
        
        Button("start") {
            book.onLiveActivity()
        }
        Button("stop") {
            book.offLiveActivity()
        }
        
        Spacer()
    }
}

#Preview {
    ContentView()
}
