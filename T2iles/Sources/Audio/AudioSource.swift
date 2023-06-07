import Foundation

//  定义音频来源的枚举类AudioSource，提供了一个扩展用来实现根据不同的来源类型选择不同的音频文件的功能。
enum AudioSource: String {
    case merge = "Merge"
    case add = "Add"
}

extension AudioSource {
    
    static func play(condition: @escaping @autoclosure () -> Bool) {
        DispatchQueue.main.async {
            if condition() {
                play(from: .moved)
            }
            play(from: .merged)
        }
    }
    
    static func play(from source: GameLogic.State) {
        switch source {
        case .merged:
            Audio.play(fileNamed: AudioSource.merge.rawValue)
        case .moved:
            Audio.play(fileNamed: AudioSource.add.rawValue)
        default:
            ()
        }
    }
}
