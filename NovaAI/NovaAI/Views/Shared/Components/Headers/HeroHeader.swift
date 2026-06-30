import SwiftUI

struct HeroHeader: View {

    var body: some View {

        VStack(alignment: .leading, spacing: AppSpacing.large) {

            Image(systemName: AppSymbols.nova)
                .font(.system(size: 30))
                .foregroundStyle(AppColors.accent)

            VStack(alignment: .leading, spacing: AppSpacing.small) {

                Text(AppConstants.appName)
                    .font(AppTypography.hero)
                    .foregroundStyle(AppColors.primaryText)

                Text(greeting)
                    .font(AppTypography.title2)
                    .foregroundStyle(AppColors.primaryText)

                Text(AppConstants.greetingTitle)
                    .font(AppTypography.body)
                    .foregroundStyle(AppColors.secondaryText)

            }

        }

    }

}

// MARK: - Greeting

private extension HeroHeader {

    var greeting: String {

        let hour = Calendar.current.component(.hour, from: Date())

        switch hour {

        case 5..<12:
            return "Good Morning"

        case 12..<17:
            return "Good Afternoon"

        case 17..<22:
            return "Good Evening"

        default:
            return "Good Night"

        }

    }

}

#Preview {

    ZStack {

        GlassBackground()

        HeroHeader()
            .padding(AppSpacing.screenPadding)

    }

}
