import SwiftUI

//  定义视图ModalView，表示一个简单的模态视图，用于展示一些简短的信息和按钮，以便用户可以选择执行某些操作或取消该操作。
struct ModalView: View {
    
    // MARK: - Environment Properties
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @Environment(\.colorSchemeBackgroundTheme) private var colorSchemeBackgroundTheme: ColorSchemeBackgroundTheme
   
    // MARK: - Properties
    
    var title: String
    var subtitle: String? = nil
    var completionHandler: () -> Void
    var cancellationHandler: (() -> Void)?
    
    // MARK: - Conformane to View protocol
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 16) {
                header
                subheader
                cancellationHandlerView
            }
            .padding()
            .background(Rectangle().fill(colorSchemeBackgroundTheme.backgroundColor(for: colorScheme)))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color.primary.opacity(0.3), radius: 20)
            .alignmentGuide(VerticalAlignment.center) {
                $0[VerticalAlignment.bottom] + 24
            }
            .frame(maxWidth: proxy.size.width / 1.2)
            .center(in: .local, with: proxy)
        }
    }
    
    private var header: some View {
        Text(title)
            .font(.system(.largeTitle, design: .monospaced))
            .bold()
            .foregroundColor(.primary)
            .animation(.modalSpring)
    }
    
    @ViewBuilder private var subheader: some View {
        if subtitle != nil {
            Text(subtitle!) // safe to unwrap
                .font(Font.system(.body, design: .monospaced).weight(.bold))
                .foregroundColor(.secondary)
                .animation(.modalSpring)
        }
    }
    
    @ViewBuilder private var cancellationHandlerView: some View {
        if cancellationHandler == nil {
            newGameBody
        } else {
            cancelBody
        }
    }
    
    private var cancelBody: some View {
        HStack(spacing: 32) {
            Button(action: cancellationHandler!) { // safe to unwrap
                Text("Cancel")
                    .foregroundColor(colorSchemeBackgroundTheme.backgroundColor(for: colorScheme))
                    .font(.system(.body, design: .monospaced))
                    .bold()
                    .zIndex(Double.greatestFiniteMagnitude)
            }
            .buttonStyle(FilledBackgroundStyle())
            .padding([.top, .leading, .bottom])
            
            Button(action: completionHandler) {
                Text("Ok")
                    .foregroundColor(colorSchemeBackgroundTheme.backgroundColor(for: colorScheme))
                    .font(.system(.body, design: .monospaced))
                    .bold()
                    .zIndex(Double.greatestFiniteMagnitude)
            }
            .buttonStyle(FilledBackgroundStyle())
            .padding([.top, .bottom, .trailing])
        }
    }
    
    private var newGameBody: some View {
        Button(action: completionHandler) {
            Text("New Game")
                .foregroundColor(colorSchemeBackgroundTheme.backgroundColor(for: colorScheme))
                .font(.system(.body, design: .monospaced))
                .bold()
                .zIndex(Double.greatestFiniteMagnitude)
        }
        .buttonStyle(FilledBackgroundStyle())
        .padding()
    }
}
