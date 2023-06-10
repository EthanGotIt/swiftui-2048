import SwiftUI

//  定义视图修饰器MainViewModifier，用于控制应用程序主界面的视觉效果，采用针对不同的屏幕大小的不同的偏移量和旋转角度，以适应不同的设备和方向。
struct MainViewModifier: ViewModifier {
    let proxy: GeometryProxy
    @Binding var presentEndGameModal: Bool
    @Binding var presentSideMenu: Bool
    @Binding var viewState: CGSize
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    func body(content: Content) -> some View {
        content
            .offset(y: presentEndGameModal ? horizontalSizeClass == .regular ? (proxy.size.width < proxy.size.height ? -proxy.size.height / 4 : -proxy.size.height / 3) : -proxy.size.height / 3 : 0)
            .rotation3DEffect(Angle(degrees: presentEndGameModal ? proxy.size.width < proxy.size.height ? Double(viewState.height / 10) - 10 : Double(viewState.height / 10) - 20 : 0), axis: (x: 10.0, y: 0, z: 0))
            .scaleEffect(presentEndGameModal ? 0.9 : 1)
            .rotation3DEffect(Angle(degrees: presentSideMenu ? Double(viewState.width / 10) - (horizontalSizeClass == .regular ? 10 : 20) : 0), axis: (x: 0, y: 10, z: 0))
            .offset(x: presentSideMenu ? (horizontalSizeClass == .regular ? proxy.size.width / 3 : proxy.size.width / 1.5) : 0)
            .offset(x: -viewState.width)
            .scaleEffect(presentSideMenu ? 0.9 : 1)
    }
}
