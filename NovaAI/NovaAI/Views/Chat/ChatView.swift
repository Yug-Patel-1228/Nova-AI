import SwiftUI

struct ChatView: View {

    let onBack: () -> Void

    var body: some View {

        NavigationStack {

            ZStack {

                GlassBackground()

                VStack {

                    Spacer()

                    Text("Chat Coming Soon")
                        .font(AppTypography.title)

                    Spacer()

                }

            }
            .toolbar {

                ToolbarItem(placement: .topBarLeading) {

                    Button {

                        onBack()

                    } label: {

                        Image(systemName: "chevron.left")

                    }

                }

            }

        }

    }

}

#Preview {

    ChatView {

    }

}
