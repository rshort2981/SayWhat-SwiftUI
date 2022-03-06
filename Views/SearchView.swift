import SwiftUI

struct SearchView: View {
    
    @StateObject var vm: ViewModel = ViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        NavigationView {
            ZStack {
                
                if colorScheme == .light {
                    vm.backgroundLight
                } else {
                    vm.backgroundDark
                }
                
                VStack {
                    SuperTextField(placeholder: Text("Artist").foregroundColor(.gray), text: $vm.artist)
                        .textCase(.lowercase)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                    
                    SuperTextField(placeholder: Text("Song").foregroundColor(.gray), text: $vm.song)
                        .textCase(.lowercase)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color.white)
                    
                    NavigationLink("Get Lyrics", destination: MainView(vm: vm))
                        .padding()
                        .background(Color.white)
                        .foregroundColor(Color.black)
                        .font(.headline)
                }
                .navigationTitle("Say What?")
                .padding()
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
} 
