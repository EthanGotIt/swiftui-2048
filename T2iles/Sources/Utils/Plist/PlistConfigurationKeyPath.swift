import Foundation

//  定义枚举类PlistConfigurationKeyPath标识属性列表文件中各个项目的键路径。
enum PlistConfigurationKeyPath: String {
    
    // MARK: - About
    
    case about
    case copyright
    case linkDescription
    case linkUrl
    
    // MARK: - Settings
    
    case settings
    case gameBoardDescription
    case gameBoardSize
    case audio
    case audioDescription
    
    // MARK: - Game Board State
    
    case gameState
    case gameOverTitle
    case gameOverSubtitle
    case resetGameTitle
    case resetGameSubtitle
}
