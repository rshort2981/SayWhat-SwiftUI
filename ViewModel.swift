import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var results: [PostModel] = []
    @Published var artist: String = ""
    @Published var song: String = ""
    @Published var showNotFound: Bool = false
    
    var backgroundLight: some View {
        Image("recordplayer")
            .resizable()
            .edgesIgnoringSafeArea(.all)
    }
    
    var backgroundDark: some View {
        Image("recordplayer")
            .resizable()
            .colorInvert()
            .edgesIgnoringSafeArea(.all)
    }
    
    func getLyrics() {
        guard let url = URL(string:"https://api.lyrics.ovh/v1/\(artist.replacingOccurrences(of: " ", with: "+"))/\(song.replacingOccurrences(of: " ", with: "+"))") else { return }
        
        downloadData(fromURL: url) { (returnedData) in
            if let data = returnedData {
                guard let decodedResponse = try? JSONDecoder().decode(PostModel.self, from: data) else { return }
                DispatchQueue.main.async { [weak self] in
                    self?.results.append(decodedResponse)
                }
            } else {
                print("No data returned.")
                DispatchQueue.main.async { [weak self] in
                    self?.showNotFound = true
                }
            }
        }
    }
    
    private func downloadData(fromURL url: URL, completionHandler: @escaping (_ data: Data?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard
                let data = data,
                error == nil,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
                print("Error downloading data.")
                completionHandler(nil)
                return
            }
            
            completionHandler(data)
            
        }.resume()
    }
    
    func clearText() {
        artist = ""
        song = ""
    }
    
    func display() {
        if !results.isEmpty  {
            results.removeFirst()
        }
    }
}
