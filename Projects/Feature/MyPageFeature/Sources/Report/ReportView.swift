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

    init(
        viewModel: ReportViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Divider().foregroundColor(.Sub.gray40)
                    .padding(.bottom, 15)

                titleTextView()
                    .padding(.bottom, 25)

                contentTextView()
                    .padding(.bottom, 25)

                screenShotView()
                    .padding(.bottom, 100)

                SolidBtn(text: "제보하기", size: .large) {
                    // 대충 제보 하는 api
                }
            }
            .padding(.horizontal, 20)
        }
        .background(Color.Sub.gray10)
        .onAppear {
            viewModel.onAppear()
        }
        .navigationTitle("버그 제보하기")
        .navigationBarItems(trailing: majorPicker())
    }

    @ViewBuilder
    func majorPicker() -> some View {
        Menu {
            ForEach(viewModel.devMajors, id: \.self) { major in
                Button {
                    viewModel.selectedDepartment = major
                } label: {
                    HStack {
                        Text(major)

                        if viewModel.selectedDepartment == major {
                            Image(systemName: "checkmark")
                        }
                    }
                }
            }
        } label: {
            HStack(spacing: 5) {
                Spacer()

                Text(viewModel.selectedDepartment)

                JOBISImage(.chevronDown)
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

            JOBISTextField(
                placeholder: "제목을 입력해주세요.",
                text: $viewModel.title,
                outlinedType: .outlined,
                onCommit: {
                    focusField = .content
                }
            )
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

            ZStack(alignment: .topLeading) {
                TextEditor(text: $viewModel.content)
                    .JOBISFont(.body(.body4), color: .Sub.gray90)
                    .padding(.top, 2)
                    .padding(.leading, 7)
                    .focused($focusField, equals: .content)
                    .onReceive(Just(viewModel.content)) { _ in
                        if 400 < viewModel.content.count {
                            viewModel.content = String(viewModel.content.prefix(400))
                        }
                    }

                Text("버그가 어떻게 났는지 설명해주세요!")
                    .JOBISFont(.body(.body4), color: .Sub.gray60)
                    .opacity(viewModel.content.isEmpty ? 1 : 0)
                    .padding(.top, 10)
                    .padding(.leading, 12)
            }
            .frame(height: 200)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .strokeBorder(
                        focusField == .content ? Color.Sub.gray60 : .Sub.gray40,
                        lineWidth: 1
                    )
            )
            .background(Color.Sub.gray10)
            .animation(.easeIn(duration: 0.3), value: focusField)
        }
    }

    @ViewBuilder
    func screenShotView() -> some View {
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
