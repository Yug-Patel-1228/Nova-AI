import Foundation
import Observation

@Observable
final class ChatManager {

    static let shared = ChatManager()

    // MARK: - All Conversations

    private(set) var conversations: [Conversation] = []

    // MARK: - Current Conversation

    private(set) var selectedConversationID: UUID?

    private init() {

        if conversations.isEmpty {

            createConversation()

        }

    }

    var currentConversation: Conversation? {

        guard let selectedConversationID else {

            return nil

        }

        return conversations.first {

            $0.id == selectedConversationID

        }

    }

    // MARK: - Create

    @discardableResult
    func createConversation() -> Conversation {

        let conversation = Conversation()

        conversations.insert(conversation, at: 0)

        selectedConversationID = conversation.id

        return conversation

    }

    // MARK: - Select

    func selectConversation(id: UUID) {

        selectedConversationID = id

    }

    // MARK: - Delete

    func deleteConversation(id: UUID) {

        guard let index = conversations.firstIndex(where: {

            $0.id == id

        }) else {

            return

        }

        let deletingCurrentConversation = (selectedConversationID == id)

        conversations.remove(at: index)

        if conversations.isEmpty {

            createConversation()
            return

        }

        if deletingCurrentConversation {

            if index < conversations.count {

                selectedConversationID = conversations[index].id

            } else {

                selectedConversationID = conversations.last?.id

            }

        }

    }

    // MARK: - Update

    func updateMessages(_ messages: [Message]) {

        guard
            let selectedConversationID,
            let index = conversations.firstIndex(where: {

                $0.id == selectedConversationID

            })
        else {

            return

        }

        conversations[index].messages = messages
        conversations[index].updatedAt = .now

        if conversations[index].title == "New Chat",
           let firstUser = messages.first(where: {

               $0.role == .user

           }) {

            conversations[index].title = String(firstUser.text.prefix(30))

        }

    }

}
