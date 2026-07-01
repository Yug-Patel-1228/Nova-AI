import SwiftUI

struct ChatView: View {

    let onBack: () -> Void

    @State private var viewModel = ChatViewModel()

    var body: some View {

        NavigationStack {

            ZStack {

                GlassBackground()

                VStack(spacing: 0) {

                    if viewModel.messages.isEmpty {

                        EmptyChatView()

                    } else {

                        ScrollView {

                            LazyVStack(
                                spacing: AppSpacing.medium
                            ) {

                                ForEach(viewModel.messages) { message in

                                    MessageBubble(
                                        message: message
                                    )

                                }

                                if viewModel.state == .thinking {

                                    TypingIndicator()
                                        .padding(.vertical)

                                }

                            }
                            .padding()

                        }

                    }

                    ChatInputBar(
                        text: $viewModel.inputText
                    ) {

                        Task {

                            await viewModel.sendMessage()

                        }

                    }

                }

            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {

                ToolbarItem(placement: .topBarLeading) {

                    Button {

                        onBack()

                    } label: {

                        Image(systemName: "chevron.left")

                    }

                }

                ToolbarItem(placement: .principal) {

                    Text(AppConstants.appName)
                        .font(AppTypography.headline)

                }

            }
            .onAppear {

                viewModel.manager = ChatManager.shared

            }

        }

    }

}

#Preview {

    ChatView {

    }

}
