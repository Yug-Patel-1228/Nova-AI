import Foundation

struct Conversation: Identifiable {

    let id = UUID()

    var title: String

    var messages: [Message]

    var lastUpdated: Date

}
