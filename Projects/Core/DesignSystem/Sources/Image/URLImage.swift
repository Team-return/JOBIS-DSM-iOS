import SwiftUI
import Kingfisher

public struct URLImage: View {
    let imageURL: URL?
    let size: CGSize

    public init(imageURL: String, size: CGFloat) {
        let baseURL = "https://jobis-bucket.s3.ap-northeast-2.amazonaws.com/"
        self.imageURL = URL(string: baseURL + imageURL)
        self.size = .init(width: size, height: size)
    }

    public var body: some View {
        KFImage(imageURL)
            .resizable()
            .placeholder { Color.Sub.gray50 }
            .aspectRatio(contentMode: .fit)
            .frame(width: size.width, height: size.height)
    }
}
