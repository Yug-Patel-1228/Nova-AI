import SwiftUI

struct ChatInputBar: View {

    @Binding var text: String

    var onSend: () -> Void

    var body: some View {

        HStack(spacing: AppSpacing.medium) {

            TextField(
                "Message Nova...",
                text: $text,
                axis: .vertical
            )
            .textFieldStyle(.plain)
            .lineLimit(1...6)

            Button {

                onSend()

            } label: {

                Image(systemName: "arrow.up.circle.fill")
                    .font(.system(size: 28))
                    .foregroundStyle(AppColors.accent)

            }
            .disabled(text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)

        }
        .padding(.horizontal, AppSpacing.large)
        .padding(.vertical, AppSpacing.medium)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .padding(.horizontal)

    }

}

#Preview {

    GlassBackground()

    ChatInputBar(
        text: .constant("")
    ) {

    }

}
