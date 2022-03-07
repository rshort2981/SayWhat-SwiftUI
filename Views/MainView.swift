import SwiftUI

struct MainView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        VStack {
            if vm.showNotFound {
                NotFoundView(vm: vm)
            } else {
                LyricsView(vm: vm)
            }
        }
    }
}
