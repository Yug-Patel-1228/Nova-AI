import SwiftUI

struct NovaIcon: View {

    var size: CGFloat = 32

    var body: some View {

        Image(systemName: AppSymbols.nova)
            .font(.system(size: size))
            .foregroundStyle(AppColors.accent)

    }

}

#Preview {
    NovaIcon(size: 60)
}
