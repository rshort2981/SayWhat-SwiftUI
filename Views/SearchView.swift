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
                    
                    Spacer()
                    
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
                    
                    Spacer()
                    
                    NavigationLink(destination: MainView(vm: vm)) {
                        Text("Get Lyrics")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(Color.black)
                            .font(.headline)
                            .cornerRadius(20)
                    }
                }
                .navigationTitle("Say What?")
                .padding()
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
} 
