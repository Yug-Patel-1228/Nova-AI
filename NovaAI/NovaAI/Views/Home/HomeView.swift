import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(systemName: "sparkles")
                    .font(.system(size: 60))

                Text("Nova AI")
                    .font(.largeTitle)
                    .bold()

                Text("Your Apple-first AI Assistant")
                    .foregroundStyle(.secondary)
            }
            .navigationTitle("Nova AI")
        }
    }
}

#Preview {
    HomeView()
}
