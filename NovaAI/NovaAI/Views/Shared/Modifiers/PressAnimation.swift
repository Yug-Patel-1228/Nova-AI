import SwiftUI

struct PressAnimation: ViewModifier {

    @GestureState private var isPressed = false

    func body(content: Content) -> some View {

        content
            .scaleEffect(isPressed ? 0.97 : 1.0)
            .animation(
                .spring(response: 0.25,
                        dampingFraction: 0.75),
                value: isPressed
            )
            .gesture(
                DragGesture(minimumDistance: 0)
                    .updating($isPressed) { _, state, _ in
                        state = true
                    }
            )

    }

}

extension View {

    func pressAnimation() -> some View {
        modifier(PressAnimation())
    }

}
