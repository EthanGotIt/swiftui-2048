import SwiftUI

//  定义结构体CheckboxToggleStyle将开关Toggle的视图渲染成一个带有一个标签和一个可切换状态的圆形复选框。
struct CheckboxToggleStyle: ToggleStyle {
    var size: CGSize = .init(width: 44, height: 44)
    
    func makeBody(configuration: Configuration) -> some View {
        return HStack {
            configuration.label
            Spacer()
            Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "checkmark.circle")
                .resizable()
                .frame(width: size.width, height: size.height)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
}
