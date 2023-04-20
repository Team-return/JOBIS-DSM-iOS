import BaseFeature
import Combine

final class InfoSettingViewModel: BaseViewModel {
    @Published var isMan: Bool = false {
        didSet {
            if self.isMan == true {
                self.isWoman = false
            }
        }
    }
    @Published var isWoman: Bool = false {
        didSet {
            if self.isWoman == true {
                self.isMan = false
            }
        }
    }
    @Published var name: String = ""
    @Published var grade: String = ""
    @Published var classRoom: String = ""
    @Published var number: String = ""

    func nextButtonDidTap() {
        print("next!")
    }
}
