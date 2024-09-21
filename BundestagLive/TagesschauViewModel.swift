//
//  TagesschauViewModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 20.09.24.
//

import Foundation

@MainActor
class TagesschauViewModel: ObservableObject {
    
    @Published var news: [News] = []
    
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    
    func loadNews() {
        Task {
            await fetchNews()
        }
    }
    
    func fetchNews() async {
        print("LOADING TAGESSCHAU NEWS")
        
        guard let url = URL(string: "https://www.tagesschau.de/api2u/news/?regions=1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16&ressort=inland") else {
            print("Ungültige Poll URL")
            errorMessage = "Ungültige News URL"
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw URLError(.badServerResponse)
            }
            
            let decodedNews = try JSONDecoder().decode(TagesschauResult.self, from: data)
            
            self.news = decodedNews.news ?? []
            
        } catch {
            errorMessage = "Fehler: \(error.localizedDescription)"
            print("Fehler beim Abrufen der News-Daten: \(error)")
        }
        
//        for n in news {
//            print(n)
//        }
        
        isLoading = false
    }
}
