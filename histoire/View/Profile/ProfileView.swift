import SwiftUI

struct ProfileView: View {
    var body: some View {
        Image(systemName: "person.fill")
    }
}

struct ProfileImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}

#Preview {
    ProfileView()
}

