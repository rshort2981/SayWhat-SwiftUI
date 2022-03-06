import SwiftUI

struct LyricsView: View {
    
    @ObservedObject var vm: ViewModel
    
    var body: some View {
        ScrollView {
            ForEach(vm.results, id: \.lyrics) { item in
                Text(vm.song.capitalized)
                    .fontWeight(.heavy)
                    
                
                Text("by \(vm.artist.capitalized)")
                    .fontWeight(.heavy)
                
                Text(item.lyrics.replacingOccurrences(of: "\n\n", with: "\n"))
                    .fontWeight(.semibold)
                    .padding()
                    .lineSpacing(10)
                    .font(.headline)
            }
            .frame(minWidth: 375, alignment: .center)
            .onAppear {
                vm.getLyrics()
            }
            .onDisappear {
                vm.clearText()
                vm.display()
            }
        }
    }
}
