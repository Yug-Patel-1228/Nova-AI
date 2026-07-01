import SwiftUI

struct SplashView: View {

    let onFinished: () -> Void

    @State private var logoVisible = false
    @State private var textVisible = false
    @State private var animationFinished = false

    var body: some View {

        ZStack {

            GlassBackground()

            VStack(spacing: AppSpacing.large) {

                Spacer()

                Image(systemName: AppSymbols.nova)
                    .font(.system(size: 56))
                    .foregroundStyle(AppColors.accent)
                    .scaleEffect(logoVisible ? 1.0 : 0.85)
                    .opacity(logoVisible ? 1 : 0)
                    .animation(
                        .spring(response: 0.8,
                                dampingFraction: 0.8),
                        value: logoVisible
                    )

                VStack(spacing: AppSpacing.small) {

                    Text(AppConstants.appName)
                        .font(AppTypography.hero)

                    Text(AppConstants.tagline)
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

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.30) {

                textVisible = true

            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {

                animationFinished = true

            }

        }
        .onChange(of: animationFinished) { _, finished in

            guard finished else { return }

            withAnimation(.easeInOut(duration: 0.45)) {

                onFinished()

            }

        }

    }

}

#Preview {

    SplashView {

    }

}
