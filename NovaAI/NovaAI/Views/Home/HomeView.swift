import SwiftUI

struct HomeView: View {

    let onNewChat: () -> Void

    @State private var chatManager = ChatManager.shared

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {

        NavigationStack {

            ZStack {

                GlassBackground()

                ScrollView {

                    VStack(
                        alignment: .leading,
                        spacing: AppSpacing.xxLarge
                    ) {

                        HeroHeader()

                        ActionCard(action: {

                            ChatManager.shared.createConversation()

                            onNewChat()

                        })

                        LazyVGrid(
                            columns: columns,
                            spacing: AppSpacing.medium
                        ) {

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

                        LazyVStack(
                            spacing: AppSpacing.small
                        ) {

                            if chatManager.conversations.isEmpty {

                                Text("No conversations yet")
                                    .foregroundStyle(.secondary)
                                    .padding()

                            } else {

                                ForEach(chatManager.conversations) { conversation in

                                    ConversationRow(
                                        conversation: conversation
                                    )
                                    .contentShape(Rectangle())
                                    .onTapGesture {

                                        chatManager.selectConversation(
                                            id: conversation.id
                                        )

                                        onNewChat()

                                    }
                                    .swipeActions {

                                        Button(
                                            role: .destructive
                                        ) {

                                            chatManager.deleteConversation(
                                                id: conversation.id
                                            )

                                        } label: {

                                            Label(
                                                "Delete",
                                                systemImage: "trash"
                                            )

                                        }

                                    }

                                }

                            }

                        }

                    }
                    .padding(AppSpacing.screenPadding)

                }

            }
            .navigationBarHidden(true)

        }

    }

}

#Preview {

    HomeView {

    }

}
