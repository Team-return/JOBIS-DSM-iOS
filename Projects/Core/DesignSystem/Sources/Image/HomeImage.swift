import SwiftUI
public struct HomeImage: View {
    public enum Image {
        case recruitment
        case findCompany
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
        case .findCompany:
            return DesignSystemAsset.Image.findCompanyImage.swiftUIImage
        case .recruitment:
            return DesignSystemAsset.Image.recruitmentImage.swiftUIImage
        }
    }
}
