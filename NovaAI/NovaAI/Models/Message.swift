import Foundation

struct Message: Identifiable, Hashable {

    let id = UUID()

    let role: Role

    let text: String

    let date: Date

}

extension Message {

    enum Role {

        case user

        case assistant

    }

}
