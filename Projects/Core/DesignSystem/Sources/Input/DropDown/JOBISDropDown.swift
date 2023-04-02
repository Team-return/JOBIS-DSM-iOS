import SwiftUI

public struct JOBISDropDown: View {
    @State private var isOpen: Bool = false
    @Binding var selectedValue: String?
    var title: String
    var selections: [String]
    @Environment(\.isEnabled) private var isEnabled: Bool
    private func isOpenToggle() {
        if isEnabled {
            self.isOpen.toggle()
        }
    }
    public init(
        selectedValue: Binding<String?>,
        title: String,
        selections: [String]
    ) {
        _selectedValue = selectedValue
        self.title = title
        self.selections = selections
    }
    public var body: some View {
        VStack(spacing: 5) {
            HStack {
                Text(selectedValue ?? title)
                    .JOBISFont(.etc(.caption),
                               color: isEnabled ? .Sub.gray80 : .Sub.gray50)
                    .padding(.leading, 16)
                Spacer()
                Image(systemName: isOpen ?
                      "chevron.up" :
                        "chevron.down")
                .resizable()
                .foregroundColor(isEnabled ? .Sub.gray80 : .Sub.gray50)
                .frame(width: 13, height: 7)
                .padding(.trailing, 15)
            }
            .frame(width: 116, height: 35)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .strokeBorder(
                        Color.Sub.gray40,
                        lineWidth: 1
                    )
            )
            .background(isEnabled ? Color.Sub.gray10 : .Sub.gray40)
            .onTapGesture {
                isOpenToggle()
            }
            .cornerRadius(30)
            .overlay(alignment: .top) {
                if isOpen {
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(selections, id: \.self) { value in
                                HStack {
                                    Text(value)
                                        .JOBISFont(.etc(.caption),
                                                   color: .Sub.gray80)
                                        .padding(.vertical, 7)
                                        .padding(.leading, 15)
                                    Spacer()
                                }
                                .background(Color.Sub.gray10)
                                .onTapGesture {
                                    self.isOpenToggle()
                                    if isEnabled {
                                        self.selectedValue = value
                                    }
                                }
                                if value != selections.last {
                                    Rectangle()
                                        .frame(width: 96, height: 1)
                                        .foregroundColor(.Sub.gray40)
                                        
                                }
                            }
                        }
                    }
                    .padding(.vertical, 3)
                    .frame(
                        width: 116,
                        height: selections.count < 5 ? 29 * CGFloat(selections.count) : 135
                    )
                    .cornerRadius(15)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .strokeBorder(
                                Color.Sub.gray40,
                                lineWidth: 1
                            )
                    )
                    .offset(y: 40)
                    .scrollDisabled(selections.count < 5)
                }
            }
        }
        .onAppear {
            selectedValue = title
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
        ZStack {
            VStack {
                JOBISDropDown(
                    selectedValue: .constant(nil),
                    title: "전공동아리",
                    selections: [
                        "DMS",
                        "Kodomo",
                        "正",
                        "그램",
                        "正",
                        "그램",
                        "正",
                        "그램",
                        "正",
                        "그램",
                        "시나브로"
                    ])
            }
            .padding(10)
        }
    }
}
