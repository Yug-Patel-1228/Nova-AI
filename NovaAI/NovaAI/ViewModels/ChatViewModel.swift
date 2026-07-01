import Foundation
import Observation

@Observable
final class ChatViewModel {

    var messages: [Message] = []

    var state: AIState = .idle

    var inputText = ""

    private let service: AIService

    init(service: AIService = MockAIService()) {

        self.service = service

    }

    func sendMessage() async {

        let text = inputText.trimmingCharacters(in: .whitespacesAndNewlines)

        guard !text.isEmpty else { return }

        let userMessage = Message(
            role: .user,
            text: text,
            date: Date()
        )

        messages.append(userMessage)

        inputText = ""

        state = .thinking

        do {

            let response = try await service.send(message: text)

            let assistantMessage = Message(
                role: .assistant,
                text: response,
                date: Date()
            )

            messages.append(assistantMessage)

            state = .idle

        } catch {

            state = .error(error.localizedDescription)

        }

    }

}
