import SwiftUI
import Kingfisher
import DesignSystem

struct BugScreenshotView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectionIndex: Int
    let attachments: [String]

    let baseURL = "https://jobis-bucket.s3.ap-northeast-2.amazonaws.com/"

    init(attachments: [String], index: Int) {
        self.attachments = attachments
        self._selectionIndex = State(initialValue: index)
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TabView(selection: $selectionIndex) {
                ForEach(0..<attachments.count, id: \.self) { index in
                    KFImage(URL(string: baseURL + attachments[index]))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(minWidth: UIScreen.main.bounds.width, maxHeight: .infinity)
                        .tag(index)
                }
            }
            Text("\(selectionIndex + 1)/\(attachments.count)")
                .JOBISFont(.etc(.caption))
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(Color.Sub.gray50.opacity(0.4))
                .cornerRadius(16)
                .padding(10)
                .onTapGesture {
                    selectionIndex = (selectionIndex + 1) % (attachments.count)
                }
        }
        .tabViewStyle(.page)
        .onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
        .background(BackgroundBlurView())
    }
}

struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
