import DesignSystem
import BookmarksDomainInterface
import RecruitmentFeatureInterface
import UtilityModule
import SwiftUI

struct BookmarkListView: View {
    @Environment(\.tabbarHidden) var tabbarHidden
    @StateObject var viewModel: BookmarkListViewModel

    private let recruitmentFactory: any RecruitmentFactory
    private let recruitmentDetailFactory: any RecruitmentDetailFactory

    init(
        viewModel: BookmarkListViewModel,
        recruitmentFactory: any RecruitmentFactory,
        recruitmentDetailFactory: any RecruitmentDetailFactory
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.recruitmentFactory = recruitmentFactory
        self.recruitmentDetailFactory = recruitmentDetailFactory
    }

    var body: some View {
        VStack(spacing: 0) {
            Divider()
                .foregroundColor(.Sub.gray40)

            if !viewModel.isFetchingBookmarkList {
                if !viewModel.bookmarkList.isEmpty {
                    List {
                        ForEach(viewModel.bookmarkList, id: \.self) { bookmark in
                            bookmarkCell(bookmark: bookmark)
                        }
                        .onDelete(perform: viewModel.deleteBookmark)
                        .listRowSeparator(.hidden)
                        .listRowBackground(Color.clear)
                        .listRowInsets(.init(top: 5, leading: 3, bottom: 5, trailing: 3))
                    }
                    .listStyle(.plain)
                    .padding(.top, 5)
                } else {
                    Spacer()

                    Text("아직 북마크한 모집의뢰서가 없어요.")
                        .JOBISFont(.body(.body4), color: .Sub.gray90)

                    Button {
                        viewModel.isNavigateRecruitmentView.toggle()
                    } label: {
                        Text("모집의뢰서 보러가기 >")
                            .JOBISFont(.etc(.caption), color: .Sub.gray60)
                            .underlineText(color: .Sub.gray60)
                    }
                }
            } else {
                ProgressView().progressViewStyle(.circular)
                    .frame(maxHeight: .infinity)
            }

            Spacer()
        }
        .padding(.horizontal, 20)
        .onAppear {
            viewModel.onAppear()
        }
        .onChange(of: viewModel.isNavigateRecruitmentView) { newValue in
            withAnimation {
                tabbarHidden.wrappedValue = newValue
            }
        }
        .navigate(
            to: recruitmentFactory.makeView().eraseToAnyView(),
            when: $viewModel.isNavigateRecruitmentView
        )
        .navigationTitle("북마크한 모집의뢰서")
    }

    @ViewBuilder
    func bookmarkCell(bookmark: BookmarkEntity) -> some View {
        Button {
            viewModel.isSheetRecruitmentDetail.toggle()
        } label: {
            HStack {
                Text(bookmark.companyName)
                    .JOBISFont(.body(.body4), color: .Sub.gray90)

                Spacer()

                Text("북마크한 날짜 : " + bookmark.createdAt)
                    .JOBISFont(.etc(.caption), color: .Sub.gray60)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 15)
            .background(
                Color.Sub.gray10
                    .cornerRadius(15)
                    .shadow(opacity: 0.1, blur: 4)
            )
            .sheet(isPresented: $viewModel.isSheetRecruitmentDetail) {
                recruitmentDetailFactory.makeView(
                    id: "\(bookmark.recruitmentID)", isDetail: false
                )
                .eraseToAnyView()
//                .presentationDragIndicator(.visible)
            }
        }
    }
}
