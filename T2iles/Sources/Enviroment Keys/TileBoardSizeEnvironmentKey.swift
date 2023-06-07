import SwiftUI

//  定义拼图面板大小的枚举类，实现其getter和setter方法，设定默认大小为4。
struct TileBoardSizeEnvironmentKey: EnvironmentKey {
    public static let defaultValue: Int = 4
}

extension EnvironmentValues {
    var tileBoardSize: Int {
        set { self[TileBoardSizeEnvironmentKey.self] = newValue }
        get { self[TileBoardSizeEnvironmentKey.self] }
    }
}
