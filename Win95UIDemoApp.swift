
import SwiftUI
import Win95UI

@main
struct Win95UIDemoApp: App {
    @StateObject private var manager = Win95WindowManager()
    @State private var bootState: BootState = .booting

    var body: some Scene {
        WindowGroup {
            switch bootState {
            case .booting:
                BootScreenView(bootState: $bootState)
            case .login:
                LoginScreenView(bootState: $bootState)
            case .desktop:
                HomeDesktopDraggable()
                    .environmentObject(manager)
            }
        }
    }
}
