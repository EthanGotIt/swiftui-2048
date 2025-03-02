import SwiftUI

//  定义视图修饰器BottomSlidableModalModifier，用于创建一个可以从底部滑出的模态框，并在用户上下滑动时响应用户交互的手势，添加自定义动画.modalSpring增加趣味性。
struct BottomSlidableModalModifier: ViewModifier {
    let proxy: GeometryProxy
    @Binding var presentEndGameModal: Bool
    @Binding var sideMenuViewState: CGSize
    @Binding var hasGameEnded: Bool
    var onGameEndCompletion: () -> Void = {  }
    let sideMenuDragHeight: CGFloat = 100
    
    func body(content: Content) -> some View {
        content
            .offset(y: presentEndGameModal ? (proxy.size.height / 2.0) : (proxy.size.height + proxy.size.height / 2))
            .offset(y: sideMenuViewState.height)
            .animation(.modalSpring, value: presentEndGameModal)
            .gesture(
                DragGesture().onChanged { value in
                    if value.translation.height > 0 {
                        sideMenuViewState.height = value.translation.height
                    }
                }
                .onEnded { value in
                    if sideMenuViewState.height > sideMenuDragHeight {
                        withAnimation(.modalSpring) {
                            presentEndGameModal = false
                            hasGameEnded = false
                            onGameEndCompletion()
                        }
                    }
                    sideMenuViewState = .zero
                }
        )
    }
}
