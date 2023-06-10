import SwiftUI

//  定义视图修饰器RoundedClippedBackground，用于在视图周围添加圆角边框，并以背景色填充内部区域。
struct RoundedClippedBackground: ViewModifier {
    let backgroundColor: Color
    let proxy: GeometryProxy

    func body(content: Content) -> some View {
        content
            .background(Rectangle().fill(backgroundColor))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.primary.opacity(0.3), radius: 20)
    }
}

