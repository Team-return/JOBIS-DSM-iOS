import SwiftUI
import DesignSystem

struct ImploymentPersentView: View {
    let totalStudentCount: Int
    let passerCount: Int
    let applyerCount: Int
    private var imploymentPersent: Float {
        Float(passerCount) / Float(totalStudentCount) * 100
    }

    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .trailing, spacing: 0) {
                HStack(spacing: 2) {
                    Text(String(format: "%.1f", imploymentPersent))
                        .JOBISFont(.heading(.heading3), color: .Sub.gray10)

                    Text("%")
                        .JOBISFont(.body(.body4), color: .Sub.gray10)
                }

                Text("대마고 취업률")
                    .JOBISFont(.etc(.caption), color: .Sub.gray10)
            }
            .padding(.leading, 20)

            Spacer()

            VStack {
                Text("합격자 수 : \(passerCount)/\(totalStudentCount)")
                    .JOBISFont(.etc(.caption), color: .Sub.gray10)

                Text("지원자 수 : \(applyerCount)/\(totalStudentCount)")
                    .JOBISFont(.etc(.caption), color: .Sub.gray10)
            }
            .padding(.trailing, 20)
        }
        .padding(.top, safeAreaTopInset())
        .padding(.bottom, 16)
        .background {
            LinearGradient(
                gradient: Gradient(colors: [.Main.blue, .Main.blue, .Main.lightBlue]),
                startPoint: .trailing, endPoint: .leading
            )
            .cornerRadius(30, corners: [.bottomLeft, .bottomRight])
            .shadow(blur: 20)
        }
        .padding(.horizontal, 14)
    }

    func safeAreaTopInset() -> CGFloat {
        var top: CGFloat? = 0
        if #available(iOS 15.0, *) {
            let scenes = UIApplication.shared.connectedScenes
            let windowScene = scenes.first as? UIWindowScene
            let window = windowScene?.windows.first
            top = window?.safeAreaInsets.top ?? 0
        } else {
            let window = UIApplication.shared.keyWindow
            top = window?.safeAreaInsets.top
        }
        return top ?? 0
    }
}
