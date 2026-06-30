import SwiftUI

struct GlassCard<Content: View>: View {

    @ViewBuilder
    let content: Content

    var body: some View {

        content
            .padding(AppSpacing.cardPadding)
            .frame(maxWidth: .infinity)
            .background(.ultraThinMaterial)
            .clipShape(
                RoundedRectangle(
                    cornerRadius: AppSpacing.cornerRadius,
                    style: .continuous
                )
            )
            .overlay(
                RoundedRectangle(
                    cornerRadius: AppSpacing.cornerRadius,
                    style: .continuous
                )
                .stroke(
                    AppColors.border,
                    lineWidth: 1
                )
            )
            .shadow(
                color: AppColors.shadow,
                radius: 20,
                y: 10
            )

    }

}

#Preview {

    GlassBackground()

    GlassCard {

        VStack {

            Text("Nova AI")
                .font(AppTypography.title)

            Text("Premium Glass Card")
                .foregroundStyle(AppColors.secondaryText)

        }

    }
    .padding()

}
