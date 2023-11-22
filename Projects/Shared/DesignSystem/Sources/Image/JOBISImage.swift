import SwiftUI

public struct JOBISImage: View {
    public enum Image {
        case recruitmentImage
        case findCompanyImage
        case winterInternImage
        case bookmarkList
        case fetchRecruitment
        case findCompany
        case profile
        case key
        case vertification
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
            .resizable()
            .renderingMode(renderingMode)
    }

    private func jobisToImage() -> SwiftUI.Image {
        switch image {
        case .findCompanyImage:
            return DesignSystemAsset.Image.findCompanyImage.swiftUIImage

        case .recruitmentImage:
            return DesignSystemAsset.Image.recruitmentImage.swiftUIImage

        case .winterInternImage:
            return DesignSystemAsset.Image.winterInternImage.swiftUIImage

        case .bookmarkList:
            return DesignSystemAsset.Icons.bookmarkListIcon.swiftUIImage

        case .fetchRecruitment:
            return DesignSystemAsset.Icons.fetchRecruitmentIcon.swiftUIImage

        case .findCompany:
            return DesignSystemAsset.Icons.findCompanyIcon.swiftUIImage

        case .profile:
            return DesignSystemAsset.Icons.profileIcon.swiftUIImage

        case .key:
            return DesignSystemAsset.Image.keyImage.swiftUIImage

        case .vertification:
            return DesignSystemAsset.Image.verificationImage.swiftUIImage
        }
    }
}
