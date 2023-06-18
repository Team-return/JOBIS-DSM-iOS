import SwiftUI
public struct MenuImage: View {
    public enum Image {
        case bookmarkList
        case fetchRecruitment
        case findCompany
        case profile
    }

    private var image: Image
    private var renderingMode: SwiftUI.Image.TemplateRenderingMode

    public init(
        _ image: Image,
        renderingMode: SwiftUI.Image.TemplateRenderingMode = .original
    ) {
        self.image = image
        self.renderingMode = renderingMode
    }

    public var body: some View {
        jobisToImage()
            .renderingMode(renderingMode)
    }

    private func jobisToImage() -> SwiftUI.Image {
        switch image {
        case .bookmarkList:
            return DesignSystemAsset.Icons.bookmarkList.swiftUIImage
        case .fetchRecruitment:
            return DesignSystemAsset.Icons.fetchRecruitment.swiftUIImage
        case .findCompany:
            return DesignSystemAsset.Icons.findCompany.swiftUIImage
        case .profile:
            return DesignSystemAsset.Icons.profile.swiftUIImage
        }
    }
}
