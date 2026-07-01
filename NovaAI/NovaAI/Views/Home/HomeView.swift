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

            List {

                // MARK: - Header

                HeroHeader()
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)

                // MARK: - New Chat

                ActionCard(action: {

                    ChatManager.shared.createConversation()

                    onNewChat()

                })
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)

                // MARK: - Features

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
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)

                // MARK: - Recent Conversations

                Section {

                    if chatManager.conversations.isEmpty {

                        Text("No conversations yet")
                            .foregroundStyle(.secondary)

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

                } header: {

                    SectionHeader(
                        title: AppConstants.recentConversations
                    )

                }

            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)

            .background {

                GlassBackground()

            }

            .navigationBarHidden(true)

        }

    }

}

#Preview {

    HomeView {

    }

}
