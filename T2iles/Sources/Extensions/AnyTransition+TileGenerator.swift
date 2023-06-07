import SwiftUI

//  定义AnyTransition的扩展，实现函数blockGenerated返回一个自定义的高级视图转场动画对象。
extension AnyTransition {
    
    static func blockGenerated(from: Edge, position: CGPoint, `in`: CGRect) -> AnyTransition {
        let anchor = UnitPoint(x: position.x / `in`.width, y: position.y / `in`.height)
        
        return AnyTransition.asymmetric(
            insertion: AnyTransition.opacity.combined(with: .move(edge: from)),
            removal: AnyTransition.opacity.combined(with: .modifier(
                active: Merged(
                    first: AnchoredScale(scaleFactor: 0.8, anchor: anchor),
                    second: BlurEffect(blurRaduis: 50)
                ),
                identity: Merged(
                    first: AnchoredScale(scaleFactor: 1, anchor: anchor),
                    second: BlurEffect(blurRaduis: 0)
                )
            ))
        )
    }
    
}
