import SwiftUI

struct GlassBackground: View {

    var body: some View {

        ZStack {

            AppColors.background
                .ignoresSafeArea()

            LinearGradient(
                colors: [
                    Color.blue.opacity(0.08),
                    Color.cyan.opacity(0.05),
                    Color.purple.opacity(0.04),
                    Color.clear
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

        }

    }

}

#Preview {
    GlassBackground()
}
