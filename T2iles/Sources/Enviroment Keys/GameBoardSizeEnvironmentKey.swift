import SwiftUI

//  定义游戏面板大小的枚举类，实现其getter和setter方法。
struct GameBoardSizeEnvironmentKey: EnvironmentKey {
    public static let defaultValue: BoardSize = .fourByFour
}

extension EnvironmentValues {
    var gameBoardSize: BoardSize {
        set { self[GameBoardSizeEnvironmentKey.self] = newValue }
        get { self[GameBoardSizeEnvironmentKey.self] }
    }
}
