import SwiftUI
import DesignSystem

struct TestView: View {
    @State private var bool: Bool = false
    @State private var disabled: Bool = false
    @State private var string: String = ""
    @State private var select: String = ""
    var body: some View {
        VStack {
            HStack {
                Group {
                    JOBISRadioBox(isOn: $bool)
                        .disabled(disabled)
                    JOBISCheckBox(isOn: $bool)
                        .disabled(disabled)
                    JOBISToggleBtn(isOn: $bool)
                        .disabled(disabled)
                }
            }
            JOBISTextField("testTF", text: $string, isError: bool, errorMessage: "에러 입니다.") {}
                .disabled(disabled)
                .padding(.horizontal, 16)
            HStack {
                Text(String(bool))
                    .onTapGesture {
                        bool.toggle()
                    }
                Text(String(disabled))
                    .onTapGesture {
                        disabled.toggle()
                    }
            }
            JOBISDropDown(
                selectedValue: $select,
                titleValue: "Weekday",
                selections: [
                    "MONDAY",
                    "TUESDAY",
                    "WEDNESDAY",
                    "THURSDAY",
                    "FRIDAY",
                    "SATURDAY",
                    "SUNDAY"
                ])
            .disabled(disabled)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
