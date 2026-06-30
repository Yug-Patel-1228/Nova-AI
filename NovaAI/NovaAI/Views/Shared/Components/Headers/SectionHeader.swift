import SwiftUI

struct SectionHeader: View {

    let title: String

    var body: some View {

        HStack {

            Text(title)
                .font(AppTypography.headline)

            Spacer()

        }

    }

}

#Preview {
    SectionHeader(title: "Recent Conversations")
        .padding()
}
