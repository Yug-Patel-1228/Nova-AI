import SwiftUI

struct MessageBubble: View {

    let message: Message

    var body: some View {

        HStack {

            if message.role == .assistant {

                bubble
                    .frame(maxWidth: 300, alignment: .leading)

                Spacer()

            } else {

                Spacer()

                bubble
                    .frame(maxWidth: 300, alignment: .trailing)

            }

        }

    }

    private var bubble: some View {

        Text(.init(message.text))
            .font(AppTypography.body)
            .foregroundStyle(message.role == .user ? .white : AppColors.primaryText)
            .padding()
            .background(background)
            .clipShape(RoundedRectangle(cornerRadius: 22))

    }

    @ViewBuilder
    private var background: some View {

        if message.role == .user {

            AppColors.accent

        } else {

            Color.white.opacity(0.08)

        }

    }

}

#Preview {

    ZStack {

        GlassBackground()

        VStack(spacing: 20) {

            MessageBubble(
                message: Message(
                    role: .assistant,
                    text: "**Hello!** 👋\n\nI'm Nova.",
                    date: .now
                )
            )

            MessageBubble(
                message: Message(
                    role: .user,
                    text: "Hi Nova!",
                    date: .now
                )
            )

        }
        .padding()

    }

}
