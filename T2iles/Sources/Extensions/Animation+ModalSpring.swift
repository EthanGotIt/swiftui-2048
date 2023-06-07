import SwiftUI

//  定义Animation的扩展，定义静态属性modalSpring返回默认Spring动画，实现函数modalSpring返回不同混合持续时间的Spring动画。
extension Animation {
    public static var modalSpring: Animation {
        .spring(response: 0.5, dampingFraction: 0.777, blendDuration: 0)
    }
    
    public static func modalSpring(duration: Double) -> Animation {
        .spring(response: 0.5, dampingFraction: 0.777, blendDuration: duration)
    }
}
