import SwiftUI

struct EmptyChatView: View {

    var body: some View {

        VStack(spacing: AppSpacing.large) {

            Spacer()

            NovaIcon(size: 64)

            VStack(spacing: AppSpacing.small) {

                Text(AppConstants.appName)
                    .font(AppTypography.hero)

                Text("How can I help today?")
                    .font(AppTypography.title2)

                Text("""
Ask anything, analyze documents,
understand images, or explore ideas.
""")
                .font(AppTypography.body)
                .foregroundStyle(AppColors.secondaryText)
                .multilineTextAlignment(.center)

            }

            Spacer()

        }
        .padding(AppSpacing.screenPadding)

    }

}

#Preview {

    ZStack {

        GlassBackground()

        EmptyChatView()

    }

}
