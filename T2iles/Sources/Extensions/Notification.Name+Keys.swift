import Foundation

//  定义Notification.Name的扩展，初始化gameBoardSize、gameBoardSizeUserInfoKey、audio和audioUserInfoKey四个属性。
extension Notification.Name {
    static var gameBoardSize = Notification.Name("eleev.astemir.2048-swiftui-game.board.size")
    static var gameBoardSizeUserInfoKey = "game.board.size"
    
    static var audio = Notification.Name("eleev.astemir.2048-swiftui-audio")
    static var audioUserInfoKey = "audio"

}
