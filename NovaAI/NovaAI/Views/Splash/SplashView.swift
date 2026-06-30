import SwiftUI

struct SplashView: View {

    @State private var logoVisible = false
    @State private var textVisible = false

    var body: some View {

        ZStack {

            GlassBackground()

            VStack(spacing: AppSpacing.large) {

                Spacer()

                Image(systemName: "sparkles")
                    .font(.system(size: 56))
                    .foregroundStyle(AppColors.accent)
                    .scaleEffect(logoVisible ? 1 : 0.85)
                    .opacity(logoVisible ? 1 : 0)
                    .animation(
                        .spring(response: 0.8,
                                dampingFraction: 0.8),
                        value: logoVisible
                    )

                VStack(spacing: AppSpacing.small) {

                    Text("Nova")
                        .font(AppTypography.hero)

                    Text("Intelligence,\nbeautifully designed.")
                        .font(AppTypography.title2)
                        .foregroundStyle(AppColors.secondaryText)
                        .multilineTextAlignment(.center)

                }
                .opacity(textVisible ? 1 : 0)
                .offset(y: textVisible ? 0 : 12)
                .animation(
                    .easeOut(duration: 0.7),
                    value: textVisible
                )

                Spacer()

            }
            .padding(AppSpacing.screenPadding)

        }
        .onAppear {

            logoVisible = true

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {

                textVisible = true

            }

        }

    }

}

#Preview {
    SplashView()
}
