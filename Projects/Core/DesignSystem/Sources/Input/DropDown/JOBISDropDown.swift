import SwiftUI

public struct JOBISDropDown: View {
    @State private var isOpen: Bool = false
    @Binding public var selectedValue: String
    public var titleValue: String
    public var selections: [String]
    @Environment(\.isEnabled) private var isEnabled: Bool
    private func isOpenToggle() {
        if isEnabled {
            self.isOpen.toggle()
        }
    }
    public init(
        selectedValue: Binding<String>,
        titleValue: String,
        selections: [String]
    ) {
        _selectedValue = selectedValue
        self.titleValue = titleValue
        self.selections = selections
    }
    public var body: some View {
        VStack(spacing: 5) {
            HStack {
                Text(selectedValue)
                    .JOBISFont(.body(.body1),
                               color: isEnabled ? .Sub.gray90 : .Sub.gray50)
                    .padding(.leading, 16)
                Spacer()
                Image(systemName: isOpen ?
                      "chevron.up" :
                        "chevron.down")
                .resizable()
                .foregroundColor(isEnabled ? .Sub.gray90 : .Sub.gray50)
                .frame(width: 13, height: 7)
                .padding(.trailing, 14)
            }
            .frame(width: 167)
            .padding(.vertical, 11)
            .overlay(
                RoundedRectangle(cornerRadius: 3)
                    .strokeBorder(
                        Color.Sub.gray40,
                        lineWidth: 1
                    )
            )
            .background(isEnabled ? Color.Sub.gray10 : .Sub.gray40)
            .onTapGesture {
                isOpenToggle()
            }
            .overlay(alignment: .top) {
                if isOpen {
                    VStack(spacing: 0) {
                        ForEach(selections, id: \.self) { value in
                            HStack {
                                Text(value)
                                    .JOBISFont(.body(.body3),
                                               color: .Sub.gray60)
                                    .padding(.vertical, 14)
                                    .padding(.leading, 16)
                                Spacer()
                            }
                            .background(Color.Sub.gray10)
                            .onTapGesture {
                                if isEnabled {
                                    self.isOpenToggle()
                                    self.selectedValue = value
                                }
                            }
                            Rectangle()
                                .frame(width: 147, height: 1)
                                .foregroundColor(.Sub.gray40)
                        }
                    }
                    .frame(width: 167)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                            .strokeBorder(
                                Color.Sub.gray40,
                                lineWidth: 1
                            )
                    )
                    .offset(y: 48)
                }
            }
        }
        .onAppear {
            selectedValue = titleValue
        }
        .onChange(of: isEnabled) { newValue in
            if newValue == false {
                isOpen = false
            }
        }
        .animation(.easeIn(duration: 0.1), value: isOpen)
    }
}

struct JOBISDropDown_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            VStack {
                JOBISDropDown(
                    selectedValue: .constant("title"),
                    titleValue: "전공동아리",
                    selections: [
                        "DMS",
                        "Kodomo",
                        "正",
                        "그램",
                        "시나브로"
                    ])
            }
            .padding(10)
        }
    }
}
