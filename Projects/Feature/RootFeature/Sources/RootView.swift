import DesignSystem
import SwiftUI

// swiftlint:disable all
struct RootView: View {
    @StateObject var viewModel: RootViewModel

    init(
        viewModel: RootViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    @State private var bool: Bool = false
    @State private var disabled: Bool = false
    @State private var dropdownSelect: String?
    var body: some View {
        VStack {
            HStack {
                SolidBtn(text: "Bool") {
                    bool.toggle()
                }
                SolidBtn(text: "Disabled") {
                    disabled.toggle()
                }
            }
            ScrollView {
                VStack(spacing: 20) {
                    VStack {
                        SolidBtn(
                            text: "버튼",
                            style: .defaultStyle,
                            action: {},
                            size: .small
                        )
                        .disabled(disabled)
                        SolidBtn(
                            text: "버튼",
                            style: .defaultStyle,
                            action: {},
                            size: .medium
                        )
                        .disabled(disabled)
                        SolidBtn(
                            text: "버튼",
                            style: .defaultStyle,
                            action: {},
                            size: .large
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                    VStack {
                        SolidBtn(
                            text: "버튼",
                            style: .lIcon,
                            action: {},
                            size: .medium,
                            icon: Image(systemName: "pencil")
                        )
                        .disabled(disabled)
                        SolidBtn(
                            text: "버튼",
                            style: .lIcon,
                            action: {},
                            size: .large,
                            icon: Image(systemName: "pencil"),
                            iconWidth: 26.4,
                            iconHeight: 26.4
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                    VStack {
                        SolidBtn(
                            text: "버튼",
                            style: .rIcon,
                            action: {},
                            size: .medium,
                            icon: Image(systemName: "pencil")
                        )
                        .disabled(disabled)
                        SolidBtn(
                            text: "버튼",
                            style: .rIcon,
                            action: {},
                            size: .large,
                            icon: Image(systemName: "pencil"),
                            iconWidth: 26.4,
                            iconHeight: 26.4
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                    VStack {
                        SolidBtn(
                            text: "버튼",
                            style: .icon1,
                            action: {},
                            icon: Image(systemName: "pencil")
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                    VStack {
                        SolidBtn(
                            text: "버튼",
                            style: .icon2,
                            action: {},
                            size: .small,
                            icon: Image(systemName: "pencil")
                        )
                        .disabled(disabled)
                        SolidBtn(
                            text: "버튼",
                            style: .icon2,
                            action: {},
                            icon: Image(systemName: "pencil"),
                            iconWidth: 26.4,
                            iconHeight: 26.4
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                }
                .padding(100)
                .background(Color.Sub.gray50)
                VStack(spacing: 20) {
                    VStack {
                        GhostBtn(
                            text: "버튼",
                            style: .defaultStyle,
                            action: {},
                            size: .small
                        )
                        .disabled(disabled)
                        GhostBtn(
                            text: "버튼",
                            style: .defaultStyle,
                            action: {},
                            size: .medium
                        )
                        .disabled(disabled)
                        GhostBtn(
                            text: "버튼",
                            style: .defaultStyle,
                            action: {},
                            size: .large
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                    VStack {
                        GhostBtn(
                            text: "버튼",
                            style: .lIcon,
                            action: {},
                            size: .medium,
                            icon: Image(systemName: "pencil")
                        )
                        .disabled(disabled)
                        GhostBtn(
                            text: "버튼",
                            style: .lIcon,
                            action: {},
                            size: .large,
                            icon: Image(systemName: "pencil"),
                            iconWidth: 26.4,
                            iconHeight: 26.4
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                    VStack {
                        GhostBtn(
                            text: "버튼",
                            style: .rIcon,
                            action: {},
                            size: .medium,
                            icon: Image(systemName: "pencil")
                        )
                        .disabled(disabled)
                        GhostBtn(
                            text: "버튼",
                            style: .rIcon,
                            action: {},
                            size: .large,
                            icon: Image(systemName: "pencil"),
                            iconWidth: 26.4,
                            iconHeight: 26.4
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                    VStack {
                        GhostBtn(
                            text: "버튼",
                            style: .icon1,
                            action: {},
                            icon: Image(systemName: "pencil")
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                    VStack {
                        GhostBtn(
                            text: "버튼",
                            style: .icon2,
                            action: {},
                            size: .small,
                            icon: Image(systemName: "pencil")
                        )
                        .disabled(disabled)
                        GhostBtn(
                            text: "버튼",
                            style: .icon2,
                            action: {},
                            icon: Image(systemName: "pencil"),
                            iconWidth: 26.4,
                            iconHeight: 26.4
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                }
                .padding(100)
                .background(Color.Sub.gray50)
                VStack(spacing: 20) {
                    VStack {
                        LightBtn(
                            text: "버튼",
                            style: .defaultStyle,
                            action: {},
                            size: .small
                        )
                        .disabled(disabled)
                        LightBtn(
                            text: "버튼",
                            style: .defaultStyle,
                            action: {},
                            size: .medium
                        )
                        .disabled(disabled)
                        LightBtn(
                            text: "버튼",
                            style: .defaultStyle,
                            action: {},
                            size: .large
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                    VStack {
                        LightBtn(
                            text: "버튼",
                            style: .lIcon,
                            action: {},
                            size: .medium,
                            icon: Image(systemName: "pencil")
                        )
                        .disabled(disabled)
                        LightBtn(
                            text: "버튼",
                            style: .lIcon,
                            action: {},
                            size: .large,
                            icon: Image(systemName: "pencil"),
                            iconWidth: 26.4,
                            iconHeight: 26.4
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                    VStack {
                        LightBtn(
                            text: "버튼",
                            style: .rIcon,
                            action: {},
                            size: .medium,
                            icon: Image(systemName: "pencil")
                        )
                        .disabled(disabled)
                        LightBtn(
                            text: "버튼",
                            style: .rIcon,
                            action: {},
                            size: .large,
                            icon: Image(systemName: "pencil"),
                            iconWidth: 26.4,
                            iconHeight: 26.4
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                    VStack {
                        LightBtn(
                            text: "버튼",
                            style: .icon1,
                            action: {},
                            icon: Image(systemName: "pencil")
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                    VStack {
                        LightBtn(
                            text: "버튼",
                            style: .icon2,
                            action: {},
                            size: .small,
                            icon: Image(systemName: "pencil")
                        )
                        .disabled(disabled)
                        LightBtn(
                            text: "버튼",
                            style: .icon2,
                            action: {},
                            icon: Image(systemName: "pencil"),
                            iconWidth: 26.4,
                            iconHeight: 26.4
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                }
                .padding(100)
                .background(Color.Sub.gray50)
                VStack(spacing: 20) {
                    VStack {
                        GrayBtn(text: "버튼", action: {}, size: .small)
                            .disabled(disabled)
                        GrayBtn(text: "버튼", action: {}, size: .medium)
                            .disabled(disabled)
                        GrayBtn(text: "버튼", action: {}, size: .large)
                            .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                }
                .padding(100)
                .background(Color.Sub.gray50)
                VStack(spacing: 20) {
                    VStack {
                        ShadowBtn(
                            text: "버튼",
                            style: .defaultStyle,
                            action: {},
                            size: .small
                        )
                        .disabled(disabled)
                        ShadowBtn(
                            text: "버튼",
                            style: .defaultStyle,
                            action: {},
                            size: .medium
                        )
                        .disabled(disabled)
                        ShadowBtn(
                            text: "버튼",
                            style: .defaultStyle,
                            action: {},
                            size: .large
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                    VStack {
                        ShadowBtn(
                            text: "버튼",
                            style: .lIcon,
                            action: {},
                            size: .medium,
                            icon: Image(systemName: "pencil")
                        )
                        .disabled(disabled)
                        ShadowBtn(
                            text: "버튼",
                            style: .lIcon,
                            action: {},
                            size: .large,
                            icon: Image(systemName: "pencil"),
                            iconWidth: 26.4,
                            iconHeight: 26.4
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                    VStack {
                        ShadowBtn(
                            text: "버튼",
                            style: .rIcon,
                            action: {},
                            size: .medium,
                            icon: Image(systemName: "pencil")
                        )
                        .disabled(disabled)
                        ShadowBtn(
                            text: "버튼",
                            style: .rIcon,
                            action: {},
                            size: .large,
                            icon: Image(systemName: "pencil"),
                            iconWidth: 26.4,
                            iconHeight: 26.4
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                    VStack {
                        ShadowBtn(
                            text: "버튼",
                            style: .icon1,
                            action: {},
                            icon: Image(systemName: "pencil")
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                    VStack {
                        ShadowBtn(
                            text: "버튼",
                            style: .icon2,
                            action: {},
                            size: .small,
                            icon: Image(systemName: "pencil")
                        )
                        .disabled(disabled)
                        ShadowBtn(
                            text: "버튼",
                            style: .icon2,
                            action: {},
                            icon: Image(systemName: "pencil"),
                            iconWidth: 26.4,
                            iconHeight: 26.4
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                }
                .padding(100)
                .background(Color.Sub.gray50)
                VStack(spacing: 20) {
                    VStack {
                        HStack {
                            JOBISCheckBox(isOn: $bool)
                                .disabled(disabled)
                            JOBISRadioBox(isOn: $bool)
                                .disabled(disabled)
                            JOBISToggleBtn(isOn: $bool)
                                .disabled(disabled)
                        }
                        .padding(.bottom, 20)
                        JOBISDropDown(
                            selectedValue: $dropdownSelect,
                            title: "Dropdown",
                            selections: [
                                "정승훈",
                                "홍승재",
                                "길근우",
                                "이하성",
                                "강지인",
                                "정지관",
                                "강용수",
                                "강민"
                            ]
                        )
                        .disabled(disabled)
                    }
                    .padding(10)
                    .background(.white)
                }
                .padding(100)
                .background(Color.Sub.gray50)
            }
        }
    }
}
