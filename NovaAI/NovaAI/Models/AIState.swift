import Foundation

enum AIState: Equatable {

    case idle

    case thinking

    case responding

    case error(String)

}
