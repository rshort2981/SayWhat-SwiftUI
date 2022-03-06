import SwiftUI

@main
struct LyricApp: App {
    var body: some Scene {
        WindowGroup {
            SearchView(vm: ViewModel())
        }
    }
}
