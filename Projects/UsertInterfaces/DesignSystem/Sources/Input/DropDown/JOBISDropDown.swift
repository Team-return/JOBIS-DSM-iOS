import SwiftUI

public struct JOBISDropDown: View {
    @State private var isOpen: Bool = false
    var selections: [String]
    @Binding var selectingValue: String
    @Environment(\.isEnabled) private var isEnabled: Bool
    init(
        selections: [String]
    ) {
        self.selections = selections
    }
    public var body: some View {
        VStack(spacing: 5) {
            HStack {
                Text(selectingValue)
                    .JOBISFont(.body(.body1), color: .Sub.gray90)
                    .padding(.leading, 16)
                Spacer()
                Image(systemName: isOpen ?
                      "chevron.up" :
                        "chevron.down")
                .resizable()
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
            .background(Color.Sub.gray10)
            .onTapGesture {
                isOpen.toggle()
            }
            .overlay(alignment: .top) {
                if isOpen {
                    VStack(spacing: 0) {
                        ForEach(selections, id: \.self) { value in
                            HStack {
                                Text(value)
                                    .JOBISFont(.body(.body3), color: .Sub.gray60)
                                    .padding(.vertical, 14)
                                    .padding(.leading, 16)
                                Spacer()
                            }
                            .background(Color.Sub.gray10)
                            .onTapGesture {
                                self.isOpen.toggle()
                                selectingValue = value
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
        .animation(.easeIn(duration: 0.1), value: isOpen)
    }
}

struct JOBISDropDown_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            VStack {
                JOBISDropDown(selections: <#T##[String]#>)
            }
            .padding(10)
        }
    }
}
