import Foundation

//  定义枚举类SelectedView用于选择不同的视图。
enum SelectedView {
    case game
    case settings
    case about
    
    var title: String {
        switch self {
        case .game:
            return "T2iles"
        case .settings:
            return "Settings"
        case .about:
            return "About"
        }
    }
}
