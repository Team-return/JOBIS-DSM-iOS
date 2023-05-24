import SwiftUI
import ApplicationsDomainInterface
import DesignSystem

struct ImploymentPersentView: View {
    let totalPassStudent: TotalPassStudentEntity?
    private var imploymentPersent: Float {
        Float(totalPassStudent?.passedCount ?? 0) /
        Float(totalPassStudent?.totalStudentCount ?? 1) * 100
    }
    private var passerCountString: String {
        guard let passedCount = totalPassStudent?.passedCount,
              let totalStudentCount = totalPassStudent?.totalStudentCount else { return  "0/1" }
        return "\(passedCount)/\(totalStudentCount)"
    }
    private var approvedCountString: String {
        guard let apprivedCount = totalPassStudent?.approvedCount,
              let totalStudentCount = totalPassStudent?.totalStudentCount else { return  "0/1" }
        return "\(apprivedCount)/\(totalStudentCount)"
    }

    var body: some View {
        HStack(alignment: .bottom) {
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 2) {
                    Text(String(format: "%.1f", imploymentPersent))
                        .JOBISFont(.heading(.heading3), color: .Sub.gray10)

                    Text("%")
                        .JOBISFont(.body(.body4), color: .Sub.gray10)
                }

                Text("대마고 취업률")
                    .JOBISFont(.etc(.caption), color: .Sub.gray10)
            }
            .padding(.leading, 32)

            Spacer()

            VStack {
                Text("합격자 수 : \(passerCountString)")
                    .JOBISFont(.etc(.caption), color: .Sub.gray10)

                Text("지원자 수 : \(approvedCountString)")
                    .JOBISFont(.etc(.caption), color: .Sub.gray10)
            }
            .padding(.trailing, 20)
        }
        .padding(.top, safeAreaTopInset())
        .padding(.bottom, 20)
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
