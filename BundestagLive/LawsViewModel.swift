//
//  LawsViewModel.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 17.09.24.
//
//https://search.dip.bundestag.de/api/v1/vorgang?f.vorgangstyp=Gesetzgebung&format=json&apikey=I9FKdCn.hbfefNWCY336dL6x62vfwNKpoN2RZ1gp21
//
// KÜRZLICHE AKTUALIESIERUNG IMPLEMENTIEREN

import Foundation

@MainActor
class NewsViewModel: ObservableObject {
    
    @Published var news: [News]? = []
//    @Published var singleNews: [News] = []
    @Published var newsSearchInput: String = ""
    @Published var errorMessage: String?
    @Published var isLoading: Bool?
    
    func loadNews() {
        Task {
            await fetchNews()
        }
    }
    
    func fetchNews() async {
        let trimmedSearch = newsSearchInput.trimmingCharacters(in: .whitespaces)
        print(trimmedSearch)
        print("LOADING NEWS")
        
        let token = "I9FKdCn.hbfefNWCY336dL6x62vfwNKpoN2RZ1gp21"
        
        guard let url = URL(string: "https://search.dip.bundestag.de/api/v1/vorgang?f.titel=\(trimmedSearch)&f.vorgangstyp=Gesetzgebung&format=json&apikey=\(token)") else {
            print("Ungültige News URL")
            errorMessage = "Ungültige News URL"
            return
        }
        let defaultURL = URL(string: "https://search.dip.bundestag.de/api/v1/vorgang?f.vorgangstyp=Gesetzgebung&format=json&apikey=\(token)")

        
        isLoading = true
        errorMessage = nil
        
        if trimmedSearch.count == 0 {
            do {
                let (data, response) = try await URLSession.shared.data(from: defaultURL!)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                let decodedNews = try JSONDecoder().decode(NewsResult.self, from: data)
                
                self.news = decodedNews.documents
                

            } catch {
                errorMessage = "Fehler: \(error.localizedDescription)"
                print("Fehler beim Abrufen der News-Daten: \(error)")
            }
        } else {
            do {
                let (data, response) = try await URLSession.shared.data(from: url)
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                let decodedNews = try JSONDecoder().decode(NewsResult.self, from: data)
                
                self.news = decodedNews.documents
                

            } catch {
                errorMessage = "Fehler: \(error.localizedDescription)"
                print("Fehler beim Abrufen der News-Daten: \(error)")
            }
        }
    }
    
    func filterNews(searchText: String) -> [News] {
        if searchText.isEmpty {
            return news ?? []
                } else {
                    return news?.filter {
                        $0.titel.contains(searchText)
                    } ?? []
                }
    }
}
