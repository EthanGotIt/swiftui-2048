import SwiftUI

//  定义颜色主题的枚举类，实现其getter和setter方法，设定默认的标准颜色主题为StandardTileColorTheme。
struct TileColorThemeEnvironmentKey: EnvironmentKey {
    public static let defaultValue: TileColorTheme = StandardTileColorTheme()
}

extension EnvironmentValues {
    var tileColorTheme: TileColorTheme {
        set { self[TileColorThemeEnvironmentKey.self] = newValue }
        get { self[TileColorThemeEnvironmentKey.self] }
    }
}
