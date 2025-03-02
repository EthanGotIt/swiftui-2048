import SwiftUI

//  定义协议TileColorTheme，目的是为数字方块提供颜色。
protocol TileColorTheme {
    typealias TilePair = (background: Color, font: Color)
    
    var lightTileColors: [TilePair] { get }
    var darkTileColors: [TilePair] { get }
    
    func colorPair(for index: Int?, _ colorScheme: ColorScheme, defaultColor: Color) -> TilePair
}

extension TileColorTheme {
    func colorPair(for index: Int?, _ colorScheme: ColorScheme, defaultColor: Color) -> TilePair {
        guard let number = index else {
            return (defaultColor, Color.black)
        }
        guard lightTileColors.count == darkTileColors.count else {
            fatalError("The color pallets for light and dark color schemes are not matching")
        }
        
        let index = Int(log2(Double(number))) - 1
        
        if index < 0 || index >= lightTileColors.count {
            fatalError("No color for such a number")
        }
        return colorScheme == .light ? lightTileColors[index] : darkTileColors[index]
    }
}
