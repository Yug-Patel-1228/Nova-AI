import SwiftUI

struct RootView: View {

    @State private var showSplash = true

    var body: some View {

        ZStack {

            if showSplash {

                SplashView()
                    .transition(.opacity)

            } else {

                HomeView()
                    .transition(.opacity)

            }

        }
        .animation(.easeInOut(duration: 0.5), value: showSplash)
        .onAppear {

            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {

                showSplash = false

            }

        }

    }

}

#Preview {
    RootView()
}
