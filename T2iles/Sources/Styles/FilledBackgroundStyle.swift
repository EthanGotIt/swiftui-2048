import SwiftUI

//  定义结构体FilledBackgroundStyle将按钮渲染成一个填充背景的圆角矩形，并在用户按下按钮时添加缩放动画。
struct FilledBackgroundStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .background(Color.primary)
            .cornerRadius(25)
            .animation(.modalSpring, value: configuration.isPressed)
    }
}
