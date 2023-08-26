import SwiftUI
import Kingfisher

public struct URLImage: View {
    public enum ImageShape {
        case square(CGFloat)
        case rectangle
    }

    let imageURL: URL?
    let shape: ImageShape

    public init(imageURL: String, shape: ImageShape) {
        let baseURL = "https://jobis-bucket.s3.ap-northeast-2.amazonaws.com/"
        self.imageURL = URL(string: baseURL + imageURL)
        self.shape = shape
    }

    public var body: some View {
        switch shape {
        case .square(let size):
            KFImage(imageURL)
                .resizable()
                .placeholder { Color.Sub.gray50 }
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)

        case .rectangle:
            KFImage(imageURL)
                .resizable()
                .placeholder { Color.Sub.gray50 }
                .aspectRatio(contentMode: .fit)
        }
    }
}
