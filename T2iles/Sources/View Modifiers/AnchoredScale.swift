import SwiftUI

//  定义视图修饰器AnchoredScale，用于对视图进行缩放操作，并且可以指定缩放的锚点。
struct AnchoredScale: ViewModifier {
    
    let scaleFactor: CGFloat
    let anchor: UnitPoint
    
    func body(content: Self.Content) -> some View {
        content.scaleEffect(scaleFactor, anchor: anchor)
    }
    
}
