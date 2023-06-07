import SwiftUI

//  定义枚举类Direction计算视图的边缘和与当前边缘相反的边缘，定义Direction的扩展。
enum Direction: String {
    
    // MARK: - Cases
    
    case left
    case right
    case up
    case down
    
    // MARK: - Computed Properties
    
    var edge: Edge {
        switch self {
        case .left:
            return .leading
        case .right:
            return .trailing
        case .up:
            return .top
        case .down:
            return .bottom
        }
    }
    
    var invertedEdge: Edge {
        edge.inverted
    }
}

extension Direction {
    var systemImageName: String {
        return "arrow." + rawValue + ".circle"
    }
}
