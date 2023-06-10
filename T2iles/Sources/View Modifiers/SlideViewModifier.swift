import SwiftUI

//  定义与手势类型绑定的视图修饰器SlideViewModifier，用于响应用户的滑动手势，并控制视图的缩放和可交互性。
struct SlideViewModifier<T: Gesture>: ViewModifier {
    var gesture: T
    @Binding var presentEndGameModal: Bool
    @Binding var presentSideMenu: Bool
    
    func body(content: Content) -> some View {
        content
            .gesture(gesture, including: .all)
            .scaleEffect((presentEndGameModal || presentSideMenu) ? 0.9 : 1.0)
            .allowsHitTesting(!(presentEndGameModal || presentSideMenu))
    }
}
