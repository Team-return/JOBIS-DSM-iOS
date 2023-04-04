import SwiftUI
public struct SigninImage: View {
    public enum Image {
        case splashIcon
        case technyFeed
        case technyLaptop
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
        case .splashIcon:
            return DesignSystemAsset.Image.splashIcon.swiftUIImage

        case .technyFeed:
            return DesignSystemAsset.Image.technyFeed.swiftUIImage

        case .technyLaptop:
            return DesignSystemAsset.Image.technyLaptop.swiftUIImage
        }
    }
}
