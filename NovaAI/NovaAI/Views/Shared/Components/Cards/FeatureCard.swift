import SwiftUI

struct FeatureCard: View {

    let icon: String
    let title: String
    let subtitle: String

    var body: some View {

        GlassCard {

            VStack(alignment: .leading,
                   spacing: AppSpacing.medium) {

                Image(systemName: icon)
                    .font(.title2)
                    .foregroundStyle(AppColors.accent)

                Spacer()

                Text(title)
                    .font(AppTypography.headline)

                Text(subtitle)
                    .font(AppTypography.caption)
                    .foregroundStyle(AppColors.secondaryText)

            }
            .frame(height: 120)

        }

    }

}

#Preview {

    ZStack {

        GlassBackground()

        FeatureCard(
            icon: AppSymbols.pdf,
            title: "Documents",
            subtitle: "Understand PDFs"
        )
        .padding()

    }

}
