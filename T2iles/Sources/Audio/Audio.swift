import AudioToolbox

//  定义音频类Audio，实现了播放音频的方法play，方法先判断是否有缓存，如果有缓存则直接播放，反之则先加载缓存再播放音频。
class Audio {
    private static var cachedURLs: [String : URL] = [:]
    
    static func play(fileNamed file: String, of type: String = "mp3") {
        func _play(file url: URL) {
            var sound: SystemSoundID = 0
            AudioServicesCreateSystemSoundID(url as CFURL, &sound)
            AudioServicesPlaySystemSound(sound)
        }
        
        if let url = cachedURLs[file] {
            _play(file: url)
        } else {
            guard let url = Bundle.main.url(forResource: file, withExtension: type) else {
                fatalError()
            }
            cachedURLs[file] = url
            _play(file: url)
        }
    }
}
