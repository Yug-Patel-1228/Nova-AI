import SwiftUI

enum AppTypography {

    // MARK: - Large Titles

    static let hero = Font.system(.largeTitle, design: .rounded)
        .weight(.bold)

    static let largeTitle = Font.largeTitle.weight(.bold)

    // MARK: - Titles

    static let title = Font.title.weight(.semibold)

    static let title2 = Font.title2.weight(.semibold)

    static let title3 = Font.title3.weight(.medium)

    // MARK: - Headlines

    static let headline = Font.headline

    static let subheadline = Font.subheadline

    // MARK: - Body

    static let body = Font.body

    static let callout = Font.callout

    static let footnote = Font.footnote

    static let caption = Font.caption

}
