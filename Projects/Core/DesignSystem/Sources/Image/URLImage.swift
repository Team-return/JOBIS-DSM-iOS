import SwiftUI
import Kingfisher

public struct URLImage: View {
    public enum ImageShape {
        case square(CGFloat)
        case rectangle
    }

    let imageURL: URL?
    let shape: ImageShape

    public init(imageURL urlString: String, shape: ImageShape) {
        let baseURL = "https://jobis-bucket.s3.ap-northeast-2.amazonaws.com/"

        if let encoded = (baseURL + urlString)
            .addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
           let imageURL = URL(string: encoded) {
            self.imageURL = imageURL
        } else {
            self.imageURL = URL(string: urlString)
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
