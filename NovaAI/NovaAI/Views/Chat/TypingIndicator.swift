import SwiftUI

struct TypingIndicator: View {

    @State private var animate = false

    var body: some View {

        HStack(spacing: 6) {

            ForEach(0..<3, id: \.self) { index in

                Circle()
                    .frame(width: 8, height: 8)
                    .scaleEffect(animate ? 1 : 0.5)
                    .animation(
                        .easeInOut(duration: 0.6)
                        .repeatForever()
                        .delay(Double(index) * 0.2),
                        value: animate
                    )

            }

        }
        .foregroundStyle(AppColors.accent)
        .onAppear {

            animate = true

        }

    }

}

#Preview {

    TypingIndicator()

}
