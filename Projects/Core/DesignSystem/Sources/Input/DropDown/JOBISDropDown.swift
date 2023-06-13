import SwiftUI

public struct JOBISDropDown: View {
    @State private var isOpen: Bool = false
    @Binding var selectedValue: String?
    @Binding var isTapBackground: Bool
    var title: String
    var selections: [String]
    var width: CGFloat
    @Environment(\.isEnabled) private var isEnabled: Bool
    private func isOpenToggle() {
        if isEnabled {
            self.isOpen.toggle()
        }
    }
    public init(
        selectedValue: Binding<String?>,
        isTapBackground: Binding<Bool>,
        title: String,
        selections: [String],
        width: CGFloat = 90
    ) {
        _selectedValue = selectedValue
        _isTapBackground = isTapBackground
        self.title = title
        self.selections = selections
        self.width = width
    }
    public var body: some View {
        VStack(spacing: 5) {
            HStack {
                Text(selectedValue ?? title)
                    .JOBISFont(.etc(.caption),
                               color: isEnabled ? .Sub.gray80 : .Sub.gray50)
                    .padding(.leading, 16)
                    .lineLimit(1)
                Spacer()
                Image(systemName: isOpen ?
                      "chevron.up" :
                        "chevron.down")
                .resizable()
                .foregroundColor(isEnabled ? .Sub.gray80 : .Sub.gray50)
                .frame(width: 13, height: 7)
                .padding(.trailing, 15)
            }
            .frame(width: width, height: 30)
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
                        LazyVStack(spacing: 0) {
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
                                        .frame(width: width - 20, height: 1)
                                        .foregroundColor(.Sub.gray40)
                                }
                            }
                        }
                    }
                    .frame(
                        width: width,
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
                    .offset(y: 37)
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
        .onChange(of: isTapBackground, perform: { _ in
            self.isOpen = false
        })
        .animation(.easeIn(duration: 0.1), value: isOpen)
    }
}

struct JOBISDropDown_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            HStack {
                JOBISDropDown(
                    selectedValue: .constant(nil),
                    isTapBackground: .constant(false),
                    title: "전공동아리",
                    selections: [
                        "DMS",
                        "Kodomo",
                        "正",
                        "DMS",
                        "Kodomo",
                        "正",
                        "DMS",
                        "Kodomo",
                        "正",
                        "그램"
                    ],
                    width: 110
                )
                HStack {
                    JOBISDropDown(
                        selectedValue: .constant(nil),
                        isTapBackground: .constant(false),
                        title: "학년",
                        selections: [
                            "1",
                            "2",
                            "3"
                        ]
                    )
                    JOBISDropDown(
                        selectedValue: .constant(nil),
                        isTapBackground: .constant(false),
                        title: "반",
                        selections: [
                            "1",
                            "2",
                            "3",
                            "4"
                        ]
                    )
                }
                .padding(10)
            }
            .padding(10)
        }
    }
}
