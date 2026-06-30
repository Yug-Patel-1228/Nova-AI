import SwiftUI

struct FeatureCard: View {

    let icon: String
    let title: String
    let subtitle: String

    var body: some View {

        Button {

        } label: {

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
        .buttonStyle(.plain)
        .pressAnimation()

    }

}

#Preview {

    ZStack {

        GlassBackground()

        FeatureCard(
            icon: AppSymbols.pdf,
            title: "Understand",
            subtitle: "Documents"
        )
        .padding()

    }

}
