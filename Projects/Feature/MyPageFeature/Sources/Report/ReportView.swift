import DesignSystem
import StudentsDomainInterface
import SwiftUI
import Combine
import UtilityModule

// swiftlint:disable function_body_length
struct ReportView: View {
    private enum FocusField {
        case title
        case content
    }
    @FocusState private var focusField: FocusField?
    @StateObject var viewModel: ReportViewModel
    @Environment(\.dismiss) var dismiss

    init(
        viewModel: ReportViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                titleTextView()
                    .padding(.bottom, 25)

                contentTextView()
                    .padding(.bottom, 25)

                screenShotImages()
                    .padding(.bottom, 25)

                HStack(alignment: .bottom) {
                    SolidBtn(text: "제보하기", size: .large) {
                        viewModel.reportBugsButtonDidTap()
                    }
                    .disabled(viewModel.isReportButtonDisable)
                }
                .frame(maxHeight: .infinity)
            }
            .padding(.horizontal, 20)
        }
        .background(Color.Sub.gray10)
        .onAppear {
            viewModel.onAppear()
        }
        .navigationTitle("버그 제보하기")
        .navigationBarItems(trailing: majorPicker())
        .onChange(of: viewModel.isSuccessReport) { _ in
            dismiss()
        }
        .jobisToast(
            isShowing: $viewModel.isErrorOcuured,
            message: viewModel.errorMessage,
            style: .error
        )
    }

    @ViewBuilder
    func majorPicker() -> some View {
        Menu {
            ForEach(viewModel.devMajors, id: \.self) { major in
                Button {
                    viewModel.selectedDepartment = major
                } label: {
                    HStack {
                        Text(major.localizedString())

                        if viewModel.selectedDepartment == major {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        } label: {
            HStack(spacing: 5) {
                Spacer()

                Text(viewModel.selectedDepartment.localizedString())

                JOBISIcon(.chevronDown)
                    .frame(width: 16, height: 16)
            }
            .frame(width: 75)
        }
        .menuStyle(BorderlessButtonMenuStyle())
    }

    @ViewBuilder
    func titleTextView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("제목")
                .JOBISFont(.etc(.caption), color: .Sub.gray70)

            JOBISFormTextField(
                "제목을 입력해주세요.",
                text: $viewModel.title
            ) {
                focusField = .content
            }
            .focused($focusField, equals: .title)
            .onReceive(Just(viewModel.title)) { _ in
                if 20 < viewModel.title.count {
                    viewModel.title = String(viewModel.title.prefix(20))
                }
            }
        }
    }

    @ViewBuilder
    func contentTextView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("내용")
                .JOBISFont(.etc(.caption), color: .Sub.gray70)

            JOBISFormTextEditor("버그가 어떻게 일어났는지 구체적으로 써주세요.", text: $viewModel.content)
                .focused($focusField, equals: .content)
                .onReceive(Just(viewModel.content)) { _ in
                    if 400 < viewModel.content.count {
                        viewModel.content = String(viewModel.content.prefix(400))
                    }
                }
        }
    }

    @ViewBuilder
    func screenShotImages() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text("스크린샷 (\(viewModel.images.count)/5)")
                .JOBISFont(.etc(.caption), color: .Sub.gray70)

            Group {
                if viewModel.images.isEmpty {
                    Image(systemName: "photo")
                        .resizable()
                        .foregroundColor(.Sub.gray50)
                        .frame(width: 16, height: 14)
                        .onTapGesture {
                            viewModel.showActionSheet.toggle()
                        }
                } else {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.images, id: \.self) { image in
                                screenShotImageCell(image: image)
                            }

                            if viewModel.images.count < 5 {
                                Button {
                                    viewModel.showActionSheet.toggle()
                                } label: {
                                    Image(systemName: "plus")
                                        .resizable()
                                        .foregroundColor(.Main.lightBlue)
                                        .frame(width: 12, height: 12)
                                        .padding(9)
                                        .background(Color.Sub.gray10)
                                        .clipShape(Circle())
                                        .shadow(blur: 4)
                                        .padding(.horizontal, 20)
                                }
                            }
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, minHeight: 100, maxHeight: 200)
            .background(Color.Sub.gray10)
            .cornerRadius(10)
            .padding(1)
            .background(Color.Sub.gray40)
            .cornerRadius(10)
            .animation(.easeIn(duration: 0.3), value: focusField)
            .hideKeyboardWhenTap()
            .photoActionSheet(
                selectionLimit: 5 - viewModel.images.count,
                images: $viewModel.images,
                $viewModel.showActionSheet
            )
        }
    }

    @ViewBuilder
    func screenShotImageCell(image: UIImage) -> some View {
        ZStack(alignment: .bottomTrailing) {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)

            Button {
                withAnimation(.easeIn(duration: 0.3)) {
                    viewModel.images.removeAll { $0 == image }
                }
            } label: {
                Image(systemName: "trash.fill")
                    .resizable()
                    .foregroundColor(.State.error)
                    .frame(width: 12, height: 13)
                    .padding(9)
                    .background(Color.Sub.gray10)
                    .clipShape(Circle())
                    .shadow(blur: 4)
                    .padding(5)
            }
        }
    }
}
