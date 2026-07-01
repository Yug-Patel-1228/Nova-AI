import Foundation

struct Conversation: Identifiable, Codable, Hashable {

    let id: UUID

    var title: String

    var messages: [Message]

    let createdAt: Date

    var updatedAt: Date

    init(
        id: UUID = UUID(),
        title: String = "New Chat",
        messages: [Message] = [],
        createdAt: Date = .now,
        updatedAt: Date = .now
    ) {

        self.id = id
        self.title = title
        self.messages = messages
        self.createdAt = createdAt
        self.updatedAt = updatedAt

    }

}
