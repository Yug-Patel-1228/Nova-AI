import Foundation

struct Message: Identifiable, Codable, Hashable {

    let id: UUID

    let role: Role

    let text: String

    let date: Date

    init(
        id: UUID = UUID(),
        role: Role,
        text: String,
        date: Date = .now
    ) {
        self.id = id
        self.role = role
        self.text = text
        self.date = date
    }

}

extension Message {

    enum Role: String, Codable {

        case user

        case assistant

    }

}
