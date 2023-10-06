import SwiftUI
import Kingfisher
import Environment

public struct URLImage: View {
    public enum ImageShape {
        case square(CGFloat)
        case rectangle
    }

    let imageURL: URL?
    let shape: ImageShape

    public init(imageURL urlString: String, shape: ImageShape) {
        let baseURL = Environment.getUrlValue(key: .s3BaseUrl)
        self.imageURL = baseURL.appendingPathComponent(urlString)

        self.shape = shape
    }

    public var body: some View {
        Group {
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
}
