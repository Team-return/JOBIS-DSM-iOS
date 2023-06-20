import BaseFeature
import UIKit
import Combine

final class ReportViewModel: BaseViewModel {
    enum Major: String {
        case all = "전체"
        case server = "서버"
        case ios = "iOS"
        case web = "웹"
    }
    let devMajors: [String] = [
        Major.all.rawValue,
        Major.server.rawValue,
        Major.ios.rawValue,
        Major.web.rawValue
    ]
    @Published var selectedDepartment: String = "전체"
    @Published var title: String = ""
    @Published var content: String = ""
    @Published var showActionSheet: Bool = false
    @Published var images: [UIImage] = []

    func onAppear() {
        // on appear
    }
}
