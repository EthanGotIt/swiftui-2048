import SwiftUI

//  定义配色方案背景主题的枚举类，实现其getter和setter方法。
struct ColorSchemeBackgroundThemeEnvironmentKey: EnvironmentKey {
    public static let defaultValue: ColorSchemeBackgroundTheme = StandardBackgroundColorScheme()
}

extension EnvironmentValues {
    var colorSchemeBackgroundTheme: ColorSchemeBackgroundTheme {
        set { self[ColorSchemeBackgroundThemeEnvironmentKey.self] = newValue }
        get { self[ColorSchemeBackgroundThemeEnvironmentKey.self] }
    }
}
