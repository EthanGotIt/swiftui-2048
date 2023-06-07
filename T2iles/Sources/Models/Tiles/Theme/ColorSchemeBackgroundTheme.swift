import SwiftUI

//  定义协议ColorSchemeBackgroundTheme和遵循该协议的结构体StandardBackgroundColorScheme，实现了为不同的颜色方案提供背景颜色和反转背景颜色的功能。
protocol ColorSchemeBackgroundTheme {
    
    // MARK: - Properties
    
    var light: Color { get }
    var dark: Color { get }
    
    // MARK: - Methods
    
    func backgroundColor(for colorScheme: ColorScheme) -> Color
    func invertedBackgroundColor(for colorScheme: ColorScheme) -> Color
}

extension ColorSchemeBackgroundTheme {
    func backgroundColor(for colorScheme: ColorScheme) -> Color {
        colorScheme == .light ? light : dark
    }
    
    func invertedBackgroundColor(for colorScheme: ColorScheme) -> Color {
        colorScheme == .dark ? light : dark
    }
}

struct StandardBackgroundColorScheme: ColorSchemeBackgroundTheme {
    var light: Color = Color(red:0.90, green:0.90, blue:0.90, opacity:1.00)
    var dark: Color = Color(red:0.10, green:0.10, blue:0.10, opacity:1.00)
}
