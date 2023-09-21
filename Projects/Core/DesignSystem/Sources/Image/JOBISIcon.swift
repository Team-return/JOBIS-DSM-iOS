import SwiftUI

// swiftlint:disable all
fileprivate extension DesignSystemImages {
    var suiImage: SwiftUI.Image {
        SwiftUI.Image(uiImage: self.image)
    }
}

public struct JOBISIcon: View {
    public enum Image {
        case chevronBarDown
        case chevronDown
        case chevronLeft
        case chevronRight
        case chevronUp
        case close
        case date
        case download
        case eyeClose
        case eyeOpen
        case fileEarmarkArrowDown
        case fileEarmarkPlus
        case logout
        case plus
        case search
        case toastError
        case toastMessage
        case toastSuccess
        case toastWarning
        case trash
        case upload
        case checkBoxIcon
        case menu
        case recruitment
        case profile
        case house
        case militaryServiceExceptionIcon
        case bookmarkOn
        case bookmarkOff
        case filterIcon
        case ios
        case android
        case dataBase
        case webScreen
        case jobis
        case isRecruitment
    }

    private var image: Image
    private var renderingMode: SwiftUI.Image.TemplateRenderingMode

    public init(
        _ image: Image,
        renderingMode: SwiftUI.Image.TemplateRenderingMode = .original
    ) {
        self.image = image
        self.renderingMode = renderingMode
    }

    public var body: some View {
        jobisIconToImage()
            .resizable()
            .renderingMode(renderingMode)
    }

    public func jobisIconToImage() -> SwiftUI.Image {
        switch image {
        case .chevronBarDown:
            return DesignSystemAsset.Icons.chevronBarDown.suiImage

        case .chevronDown:
            return DesignSystemAsset.Icons.chevronDown.suiImage

        case .chevronLeft:
            return DesignSystemAsset.Icons.chevronLeft.suiImage

        case .chevronRight:
            return DesignSystemAsset.Icons.chevronRight.suiImage

        case .chevronUp:
            return DesignSystemAsset.Icons.chevronUp.suiImage

        case .close:
            return DesignSystemAsset.Icons.close.suiImage

        case .date:
            return DesignSystemAsset.Icons.date.suiImage

        case .download:
            return DesignSystemAsset.Icons.download.suiImage

        case .eyeClose:
            return DesignSystemAsset.Icons.eyeClose.suiImage

        case .eyeOpen:
            return DesignSystemAsset.Icons.eyeOpen.suiImage

        case .fileEarmarkArrowDown:
            return DesignSystemAsset.Icons.fileEarmarkArrowDown.suiImage

        case .fileEarmarkPlus:
            return DesignSystemAsset.Icons.fileEarmarkPlus.suiImage

        case .logout:
            return DesignSystemAsset.Icons.logout.suiImage

        case .menu:
            return DesignSystemAsset.Icons.menu.suiImage

        case .plus:
            return DesignSystemAsset.Icons.plus.suiImage

        case .search:
            return DesignSystemAsset.Icons.search.suiImage

        case .toastError:
            return DesignSystemAsset.Icons.toastError.suiImage

        case .toastMessage:
            return DesignSystemAsset.Icons.toastMessage.suiImage

        case .toastSuccess:
            return DesignSystemAsset.Icons.toastSuccess.suiImage

        case .toastWarning:
            return DesignSystemAsset.Icons.toastWarning.suiImage

        case .trash:
            return DesignSystemAsset.Icons.trash.suiImage

        case .upload:
            return DesignSystemAsset.Icons.upload.suiImage

        case .checkBoxIcon:
            return DesignSystemAsset.Icons.checkBoxIcon.suiImage

        case .profile:
            return DesignSystemAsset.Icons.profile.suiImage

        case .house:
            return DesignSystemAsset.Icons.house.suiImage

        case .recruitment:
            return DesignSystemAsset.Icons.recruitment.suiImage

        case .militaryServiceExceptionIcon:
            return DesignSystemAsset.Icons.militaryServiceExceptionIcon.suiImage

        case .bookmarkOn:
            return DesignSystemAsset.Icons.bookmarkOn.suiImage

        case .bookmarkOff:
            return DesignSystemAsset.Icons.bookmarkOff.suiImage

        case .filterIcon:
            return DesignSystemAsset.Icons.filterIcon.suiImage
    
        case .ios:
            return DesignSystemAsset.Icons.ios.suiImage

        case .android:
            return DesignSystemAsset.Icons.android.suiImage

        case .dataBase:
            return DesignSystemAsset.Icons.dataBase.suiImage

        case .webScreen:
            return DesignSystemAsset.Icons.webScreen.suiImage

        case .jobis:
            return DesignSystemAsset.Icons.jobis.suiImage

        case .isRecruitment:
            return DesignSystemAsset.Icons.isRecruitment.suiImage
        }
    }
}
