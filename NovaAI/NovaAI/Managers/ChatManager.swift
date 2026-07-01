import Foundation
import Observation

@Observable
final class ChatManager {

    static let shared = ChatManager()

    // MARK: - Storage Keys

    private let conversationsKey = "nova.conversations"
    private let selectedConversationKey = "nova.selectedConversation"

    // MARK: - All Conversations

    private(set) var conversations: [Conversation] = []

    // MARK: - Current Conversation

    private(set) var selectedConversationID: UUID?

    private init() {

        load()

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

        save()

        return conversation

    }

    // MARK: - Select

    func selectConversation(id: UUID) {

        selectedConversationID = id

        save()

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

        save()

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

        save()

    }

    // MARK: - Persistence

    private func save() {

        do {

            let data = try JSONEncoder().encode(conversations)

            UserDefaults.standard.set(
                data,
                forKey: conversationsKey
            )

            UserDefaults.standard.set(
                selectedConversationID?.uuidString,
                forKey: selectedConversationKey
            )

        } catch {

            print("Failed to save conversations:", error)

        }

    }

    private func load() {

        guard let data = UserDefaults.standard.data(
            forKey: conversationsKey
        ) else {

            return

        }

        do {

            conversations = try JSONDecoder().decode(
                [Conversation].self,
                from: data
            )

            if let uuid = UserDefaults.standard.string(
                forKey: selectedConversationKey
            ) {

                selectedConversationID = UUID(uuidString: uuid)

            }

        } catch {

            print("Failed to load conversations:", error)

        }

    }

}
