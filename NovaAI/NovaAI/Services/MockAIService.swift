import Foundation

final class MockAIService: AIService {

    func send(message: String) async throws -> String {

        try await Task.sleep(for: .seconds(1.2))

        return """
        This is a mock AI response.

        You said:

        "\(message)"

        Later this will come from a real AI model.
        """

    }

}
