import SwiftUI

//  定义视图修饰器BlurEffect，用于在视图上添加高斯模糊效果。
struct BlurEffect: ViewModifier {
    
    let blurRaduis: CGFloat
    
    func body(content: Self.Content) -> some View {
        content.blur(radius: blurRaduis)
    }
    
}

