import SwiftUI

struct ActionCard: View {

    var action: (() -> Void)? = nil

    var body: some View {

        Button {

            action?()

        } label: {

            GlassCard {

                HStack(spacing: AppSpacing.medium) {

                    NovaIcon(size: 28)

                    VStack(alignment: .leading,
                           spacing: AppSpacing.small) {

                        Text(AppConstants.newChatTitle)
                            .font(AppTypography.title2)
                            .foregroundStyle(AppColors.primaryText)

                        Text(AppConstants.newChatSubtitle)
                            .font(AppTypography.body)
                            .foregroundStyle(AppColors.secondaryText)

                    }

                    Spacer()

                    Image(systemName: AppSymbols.arrow)
                        .font(.system(size: 26))
                        .foregroundStyle(AppColors.secondaryText)

                }
                .padding(AppSpacing.large)

            }

        }
        .buttonStyle(.plain)
        .pressAnimation()

    }

}

#Preview {

    ZStack {

        GlassBackground()

        ActionCard()
            .padding()

    }

}
