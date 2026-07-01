import Foundation

protocol AIService {

    func send(message: String) async throws -> String

}
