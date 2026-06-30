import SwiftUI

struct HomeView: View {

    var body: some View {

        ZStack {

            GlassBackground()

            ScrollView {

                VStack(alignment: .leading, spacing: AppSpacing.xxLarge) {

                    Spacer(minLength: 40)

                    VStack(alignment: .leading, spacing: AppSpacing.medium) {

                        Spacer(minLength: 40)

                        HeroHeader()

                    }

                    GlassCard {

                        VStack(alignment: .leading, spacing: AppSpacing.medium) {

                            Text("Ask Anything")
                                .font(AppTypography.headline)

                            HStack {

                                Image(systemName: "message")

                                Text("Type your message...")

                            }
                            .foregroundStyle(AppColors.secondaryText)

                        }

                    }

                    Spacer()

                }
                .padding(AppSpacing.screenPadding)

            }

        }

    }

}

#Preview {
    HomeView()
}
