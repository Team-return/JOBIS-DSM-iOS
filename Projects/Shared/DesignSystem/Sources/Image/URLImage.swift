import SwiftUI
import Kingfisher
import JOBISEnvironment

public struct URLImage: View {
    public enum ImageShape {
        case square(CGFloat)
        case rectangle
    }

    let imageURL: URL?
    let shape: ImageShape

    public init(imageURL urlString: String, shape: ImageShape) {
        let baseURLString = JOBISEnvironment.getValue(key: .s3BaseUrl)
        if urlString.contains(baseURLString) {
            imageURL = URL(string: urlString)
        } else {
            self.imageURL = URL(string: baseURLString + "/" + urlString)
        }

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
