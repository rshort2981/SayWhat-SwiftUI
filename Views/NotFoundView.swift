import SwiftUI

struct NotFoundView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        Text("Song not found...")
            .onDisappear {
                vm.clearText()
                vm.display()
                vm.showNotFound = false
            }
    }
}
