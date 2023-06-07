import SwiftUI

//  定义View的扩展，定义属性eraseToAnyView将当前的视图包装成 AnyView 类型的视图。
extension View {
    
    var eraseToAnyView: AnyView {
        return AnyView(self)
    }
    
}
