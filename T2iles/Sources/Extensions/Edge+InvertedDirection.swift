import SwiftUI

//  定义Edge的扩展，定义属性inverted返回该边缘位置的反向位置。
extension Edge {
    
    var inverted: Edge {
        switch self {
        case .top:
            return .bottom
        case .bottom:
            return .top
        case .leading:
            return .trailing
        case .trailing:
            return .leading
        }
    }
}
