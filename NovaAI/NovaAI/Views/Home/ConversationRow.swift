import SwiftUI

struct ConversationRow: View {

    let conversation: Conversation

    var body: some View {

        VStack(alignment: .leading, spacing: 4) {

            Text(conversation.title)
                .font(.headline)

            Text("\(conversation.messages.count) messages")
                .font(.caption)
                .foregroundStyle(.secondary)

        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()

    }

}

#Preview {

    ConversationRow(
        conversation: Conversation(
            title: "My First Chat"
        )
    )

}
