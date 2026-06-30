import SwiftUI

struct HomeView: View {

    let onNewChat: () -> Void

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {

        NavigationStack {

            ZStack {

                GlassBackground()

                ScrollView {

                    VStack(alignment: .leading,
                           spacing: AppSpacing.xxLarge) {

                        HeroHeader()

                        ActionCard(action: onNewChat)

                        LazyVGrid(columns: columns,
                                  spacing: AppSpacing.medium) {

                            FeatureCard(
                                icon: AppSymbols.pdf,
                                title: AppConstants.understandDocuments,
                                subtitle: AppConstants.documentsSubtitle
                            )

                            FeatureCard(
                                icon: AppSymbols.image,
                                title: AppConstants.analyzeImages,
                                subtitle: AppConstants.imagesSubtitle
                            )

                            FeatureCard(
                                icon: AppSymbols.voice,
                                title: AppConstants.talkNaturally,
                                subtitle: AppConstants.voiceSubtitle
                            )

                            FeatureCard(
                                icon: AppSymbols.search,
                                title: AppConstants.exploreWeb,
                                subtitle: AppConstants.webSubtitle
                            )

                        }

                        SectionHeader(
                            title: AppConstants.recentConversations
                        )

                        VStack(spacing: AppSpacing.medium) {

                            Image(systemName: "message.badge")
                                .font(.system(size: 40))
                                .foregroundStyle(AppColors.secondaryText)

                            Text("No conversations yet")
                                .font(AppTypography.headline)

                            Text("Start your first conversation with Nova.")
                                .font(AppTypography.body)
                                .foregroundStyle(AppColors.secondaryText)
                                .multilineTextAlignment(.center)

                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, AppSpacing.xxLarge)

                    }
                    .padding(AppSpacing.screenPadding)

                }

            }
            .navigationBarHidden(true)

        }

    }

}

#Preview {
    HomeView(onNewChat: {

    })
}
