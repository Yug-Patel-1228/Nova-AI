import SwiftUI

struct HomeView: View {

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

                        ActionCard()

                        LazyVGrid(columns: columns,
                                  spacing: AppSpacing.medium) {

                            FeatureCard(
                                icon: AppSymbols.pdf,
                                title: "Documents",
                                subtitle: "Understand PDFs"
                            )

                            FeatureCard(
                                icon: AppSymbols.image,
                                title: "Images",
                                subtitle: "Analyze photos"
                            )

                            FeatureCard(
                                icon: AppSymbols.voice,
                                title: "Voice",
                                subtitle: "Talk naturally"
                            )

                            FeatureCard(
                                icon: AppSymbols.search,
                                title: "Web",
                                subtitle: "Explore online"
                            )

                        }

                        SectionHeader(
                            title: AppConstants.recentConversations
                        )

                        Text("No conversations yet")
                            .foregroundStyle(AppColors.secondaryText)

                    }
                    .padding(AppSpacing.screenPadding)

                }

            }
            .navigationBarHidden(true)

        }

    }

}

#Preview {
    HomeView()
}
