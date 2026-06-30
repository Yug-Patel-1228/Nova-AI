import SwiftUI

struct ActionCard: View {

    var body: some View {

        GlassCard {

            HStack(spacing: AppSpacing.medium) {

                Image(systemName: "apple.intelligence")
                    .font(.system(size: 28))
                    .foregroundStyle(AppColors.accent)

                VStack(alignment: .leading, spacing: AppSpacing.small) {

                    Text("New Chat")
                        .font(AppTypography.title2)
                        .foregroundStyle(AppColors.primaryText)

                    Text("Ask Nova anything...")
                        .font(AppTypography.body)
                        .foregroundStyle(AppColors.secondaryText)

                }

                Spacer()

                Image(systemName: "arrow.right.circle.fill")
                    .font(.system(size: 26))
                    .foregroundStyle(.secondary)

            }
            .padding(AppSpacing.large)

        }

    }

}

#Preview {
    ZStack {

        GlassBackground()

        ActionCard()
            .padding()

    }
}
