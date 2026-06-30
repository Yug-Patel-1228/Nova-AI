import SwiftUI

struct RootView: View {

    @State private var screen: AppScreen = .splash

    var body: some View {

        switch screen {

        case .splash:

            SplashView {

                withAnimation(.spring(response: 0.6,
                                      dampingFraction: 0.85)) {

                    screen = .home

                }

            }

        case .home:

            HomeView(onNewChat: {

                withAnimation(.spring(response: 0.55,
                                      dampingFraction: 0.85)) {

                    screen = .chat

                }

            })

        case .chat:

            ChatView(onBack: {

                withAnimation(.spring(response: 0.55,
                                      dampingFraction: 0.85)) {

                    screen = .home

                }

            })

        }

    }

}

#Preview {
    RootView()
}
